#!/bin/bash
#testing including the files into main.sh
: '
echo "testing how to pass array and use shitft"
echo "the initial list is "$@""
echo "first parameter "$1""

while [ $# -gt 0 ]; do
   shift
   echo $1
done
echo "testing weather the variable after shifting "$@""
'
echo "testing using array"
arr=( "test" "test3" "test4" )
echo "${arr[0]}"

if [ -f "first" ] && [ -f "first2" ] ; then
    echo "the file exists."
else
    echo "the file doesn't exists"
fi
