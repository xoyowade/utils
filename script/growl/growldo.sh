#!/bin/bash

cmd=$@
start=$(date +'%s')
$cmd
stop=$(date +'%s')
let elapsed=$stop-$start
ssh_client=`echo $SSH_CLIENT $SSH2_CLIENT | awk '{print $1}'`
host=${GROWL_HOST_IP:=$ssh_client}
cd $(dirname $(readlink $0))
python growlnotify.py "$host" "$cmd" "completed in [$elapsed] secs @ [$PWD]"
