#!/bin/bash
# $1 Getting the first parameter  variable - to see which command user want to use.
# -i, to use the normal remove command but only mov the file to a folder called mywastebasket.
# -c, used to clear the mywastebasket folder content (ask user for comfirmation bfr the operation)

#This file is mainly used for main functions like getting console variable and handle use

#importing important files
. ./clearBasket.sh

if [ "$1" = "-i" ]; then
   printf "So you want to move away this file"
   elif [ $1 =  "-c"  ]; then 
      shift
      printf "ya so you want to clear the basket?"
      clearBasket "$@"
   elif [ $1 = "-ic" ] || [ $1 = "-ci" ]; then 
      printf "So you want to delete one file permanently."
   else 
      printf "Error occured"
fi


