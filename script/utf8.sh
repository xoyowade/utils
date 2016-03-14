#!/bin/zsh

if [[ $# -lt 1 ]]; then
    echo "Usage: $0 <file>" >&2
fi

file=$1
tempfile=`tempfile`
iconv -f gb2312 -t UTF-8 $file > $tempfile
mv $tempfile $file
