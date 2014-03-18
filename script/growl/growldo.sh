#!/bin/bash

cmd=$@
start=$(date +'%s')
$cmd
stop=$(date +'%s')
let elapsed=$stop-$start
host=`cat ~/.growl_host`
cd $(dirname $(readlink $0))
python growlnotify.py "$host" "$cmd" "completed in [$elapsed] secs @ [$PWD]"
