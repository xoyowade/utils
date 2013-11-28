#!/bin/bash

cmd=$@
start=$(date +'%s')
$cmd
stop=$(date +'%s')
let elapsed=$stop-$start
ip=`echo $SSH2_CLIENT | awk '{print $1}'`
python ~/app/growlnotify.py $ip "$cmd" "under [$PWD] completed in [$elapsed] secs"
