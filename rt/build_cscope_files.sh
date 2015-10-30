#!/bin/sh

mode="part"
if [ $# -gt 0 ]; then
mode=$1
fi

if [ "x$mode" != "xfull" ]; then
  find -L . \( -name "*.c" -o -name "*.cc" -o -name "*.cpp" -o -name "*.h" -o -name "*.hpp" \) -exec readlink -f {} \; > cscope.files
else
  find -L . \( -name "*.c" -o -name "*.cc" -o -name "*.cpp" -o -name "*.h" -o -name "*.hpp" \) -exec readlink -f {} \; | grep -v "_test.cc" > cscope.files
fi
