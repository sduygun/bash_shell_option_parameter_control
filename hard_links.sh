#! /bin/bash

find / -xdev -links +1 -type f -ls
