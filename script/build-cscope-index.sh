cur_dir=`pwd`
include_dir=../include
find -L . -name "[a-zA-Z]*.[chsS]" -o -name "*.cpp" -o -name "*.hpp" -o -name "*.cc" > cscope.files
if [[ -d $include_dir ]]; then
	find -L $include_dir -name "[a-zA-Z]*.[chsS]" -o -name "*.cpp" -o -name "*.hpp" -o -name "*.cc" >> cscope.files
else
	echo "$include_dir not exist"
fi
