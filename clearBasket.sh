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
         location="${basketLocation}/"$1""
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
   mkdir "$basketLocation"

}
