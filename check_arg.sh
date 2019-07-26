#! /bin/bash
OPTIND=1         # Reset in case getopts has been used previously in the shell.

# Initialize our own variables:

error="please provide correct arguments and options\nUsage: $0 [-i|-n] [USERS]\nOptions (optional): -i or -n for interactive or non-interactive execution
\nArguments: list of user names\nEvery user name must match this regular expression: '^[a-z][a-z0-9_]*$'"
strng_error='ERR: option after an argument or wrong argument or wrong option 2:'
default_option='-i'
if [[ -z $@ ]]; then	#This if statemens cehcks Options and Parameters.
        echo -e $error
        exit 0
fi
  while getopts  ":n: :i:" opt; do #using getopts option inorder to control options and arguments

      case "$opt" in
      i)
          if [[ $OPTARG =~ ^[a-z][a-z0-9_]*$ ]]; then # checking regular experitios.
          echo 'Options and arguments okay'
          echo 'running in interactive mode'
          exit 0
          else
          echo -e $strng_error $OPTARG
          echo -e $error
          exit 1
          fi
          ;;

      n)  if [[ $OPTARG =~ ^[a-z][a-z0-9_]*$ ]]; then # checking regular expretions.
          echo 'Options and arguments okay'
          echo 'running in noninteractive mode'
          exit 0
          else
          echo $error
          exit 1
          fi
          ;;
      \?) echo 'Invalid option.'
          exit 0
          ;;

      :)  echo "Invalid Option: -$OPTARG requires an argument"
          exit 1
          ;;
      esac

  done

    if (( $OPTIND == 1 )); then
    if [[ $1 =~ ^[a-z][a-z0-9_]*$ ]]; then # checking regular experitios.
    echo 'Options and arguments okay'
    echo 'running in interactive mode'
    exit 0
    else
    echo -e $strng_error $OPTARG
    echo -e $error
    exit 1
    fi
  fi


shift $((OPTIND-1))
