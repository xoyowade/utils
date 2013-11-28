#! /bin/bash 

if [[ $# -lt 1 ]]
then
echo "Usage: $0 <svn_dir> <ignore_file>"
fi

svn_dir=$1
ignore_file=$2
svn -R propset svn:ignore -F $ignore_file $svn_dir
