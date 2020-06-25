#!/bin/bash
# $1 Getting the first parameter  variable - to see which command user want to use.
# -i, to use the normal remove command but only mov the file to a folder called mywastebasket.
# -c, used to clear the mywastebasket folder content (ask user for comfirmation bfr the operation)

#This file is mainly used for main functions like getting console variable and handle use

#importing important files
. ./clearBasket.sh

basketLocation="~/Desktop/myWasteBasket"

command="$1"

if [ $command = "-i" ]; then
   printf "So you want to move away this file \n"
   elif [ $command =  "-c"  ]; then 
      shift
      printf "ya so you want to clear the basket? \n"
      clearBasket "$@" #clear the folder
   elif [ $command = "-ic" ] || [ $command = "-ci" ]; then 
      printf "So you want to delete one file permanently. \n"
   else 
      printf "Error occured"
fi


