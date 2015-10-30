#!/bin/zsh

if [[ $# -lt 1 ]]; then
    echo "Usage: $0 <pid>" >&2
fi

while [ -e /proc/$1 ]; do sleep 1; done; 
