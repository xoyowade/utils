#! /bin/bash 

if [[ $# -lt 2 ]]
then
echo "Usage: $0 <svn_dir> <ignore_file>"
fi

svn_dir=$1
ignore_file=$2
ignore=`cat $ignore_file`
for pathname in `find $svn_dir -type d ! -path "*/.svn*"`; do
	lines="$( svn propget svn:ignore $pathname )"
	grep -F -x -q "$ignore" - <<< "$lines" ||
	svn propset svn:ignore "$lines"$'\n'"$ignore" $pathname
done
