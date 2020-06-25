#!/bin/bash
# $1 Getting the first parameter  variable - to see which command user want to use.
# -i, to use the normal remove command but only mov the file to a folder called mywastebasket.
# -c, used to clear the mywastebasket folder content (ask user for comfirmation bfr the operation)

#This file is mainly used for main functions like getting console variable and handle use

#importing important files
. ./clearBasket.sh

basketLocation="/home/kali/Desktop/myWasteBasket"

command="$1"

if [ $# -gt 0  ]; then   
  
   if [ $command = "-i" ]; then
      printf "So you want to move away this file \n"
   
   elif [ $command =  "-c"  ]; then 
      shift
      
      if [ $# -eq 0 ]; then
         printf "Beginning myWasteBasket content deletion operation. \n"
         clearBasketAll #clear the folder
     
      else
         printf "Invalid argument[s] usage, no other argument are supposed to be included after -c !!! \n"
         printf "Exiting program\n\n"
         exit 127
      fi
   
   elif [ $command = "-ic" ] || [ $command = "-ci" ]; then 
     
      if [ $# -gt 0 ]; then
      printf "Beginning operation for deleting single file from myWasteBasket \n\n"
     
      else
         printf "Invalid argument[s] usage, user will need to include files name to be deleted!!!"
         exit 127
      fi

   else
      printf "Invalid command usage, $command command not found!!! \n\n"
      exit 126
   fi

else
   printf "Error, at least 1 (one) arguments are needed!!!\n\n"
     exit 127
fi
