#! /bin/bash

date=`date +"%Y%m%d"`
mv /tmp/state.log /tmp/statelog.$date
find /tmp/ -mindepth 1 -name 'statelog*' -mtime +14 -delete
