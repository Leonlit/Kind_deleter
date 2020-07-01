#!/bin/bash
# $1 Getting the first parameter  variable - to see which command user want to use.
# -i, to use the normal remove command but only mov the file to a folder called mywastebasket.
# -c, used to clear the mywastebasket folder content (ask user for comfirmation bfr the operation)
# -ic or -ci are used to delete individual files in myWasteBasket

#This file is mainly used for main functions like getting console variable and handle use

#importing important files
. ./clearBasket.sh
. ./deleteFiles.sh

basketLocation="/home/kali/Desktop/myWasteBasket"

command="$1"

if [ $# -gt 0  ]; then   
   shift  #so that we can use the other arguments as file (assumes)
   if [ $command = "-i" ]; then
      if [ $# -gt 0 ]; then
         deleteFiles "$@"
      else 
         echo "Error, -i need at least one arguments after it"
         exit 1
      fi
   
   elif [ $command =  "-c"  ]; then
      
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
      printf "Beginning operation for deleting individual files from myWasteBasket \n\n"
      clearBasketMultiples "$@"

      else
         printf "Invalid argument[s] usage, user will need to include files name to be deleted!!!\n\n"
         exit 127
      fi

   else
      printf "Invalid command usage, $command command not found!!! \n\n"
      exit 126
   fi

else
   printf "Error, at least 1 (one) arguments are needed!!!\n"
   printf "Available Commands are :\n\n"
   echo "-i , delete certain file(s)"
   echo "-c , clearing the myWasteBasket"
   echo "-ic or -ci, clearing certain file(S) in myWasteBsket"
   echo 
   exit 127
fi
