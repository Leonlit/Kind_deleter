#!/bin/bash
# $1 Getting the first parameter  variable - to see which command user want to use.
# -i, to use the normal remove command but only mov the file to a folder called mywastebasket.
# -c, used to clear the mywastebasket folder content (ask user for comfirmation bfr the operation)
# -ic or -ci are used to delete individual files in myWasteBasket

basketLocation="/home/kali/Desktop/myWasteBasket"


#file for moving files into the basket

deleteFiles() {
   if [ ! -d "$basketLocation" ]; then
      createBasket
   fi
      while [ $# -gt 0 ]; do
         echo "deleting file "$1"" 
         baseName=$(basename "$1")
         tempName="${basketLocation}/"$baseName""
         counter=0
      
         if [ -f "$1" ] || [ -d "$1" ]; then
            while [ -f "$tempName" ] || [ -d "$tempName" ];  do
               tempName=""${basketLocation}"/"$baseName"("$counter")"
               let "counter++"
            done

            if [ -d "$1" ]; then
               mv  -v "$1" "$tempName"
            else
               echo "$tempName"
               mv "$1" "$tempName"
            fi
         else 
            echo "file "$1" not found"
         fi

         shift
      done
}

#file for clearing the folder content

clearBasketAll () {
    if [ -d "$basketLocation" ]; then
       printf "Do you wish to clear myWasteBasket content? \n\n"
       ls -A "$basketLocation"
       
       select yn in "Yes" "No"; do
          case $yn in
               Yes ) 
                  # Control will enter here if $DIRECTORY exists.
                  if [ "$(ls -A $basketLocation)" ]; then
                     rm -rfv "$basketLocation"/* 
                  else 
                     echo "myWasteBasket is empty, exiting operation!!!"
                  fi
               break; ;;
         
               No )
                  echo "Aborting operation"
                  exit;;
            esac
         done
      else
         echo "myBasket directory in "$basketLocation" not found!"
         createBasket
   fi
}


clearBasketMultiples () {
   if [ ! -d "$basketLocation" ]; then
      createBasket
   else
      while [ $# -gt 0 ]; do
         echo "Removing the File: "$1""
         baseName=$(basename "$1")
         location="${basketLocation}/"$baseName""
         if [ -d "$location" ]; then            
            printf "\nAre you sure you want to delete the directory?\n"
            rm -rf -I "$location"
         else
            printf "\n"
            rm -i "$location"
         fi
         shift
      done
   fi
}

createBasket () {
   echo "Creating myWasteBasket in desktop!!!"
   echo "aborting initial command operation!!!"
   mkdir "${basketLocation}"

}

if [ $# -gt 0  ]; then   
   command="$1"
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


