#file for clearing the folder content

clearBasketAll () {
   printf "Do you wish to clear myWasteBasket content? \n\n"
   ls -A "$basketLocation"
   select yn in "Yes" "No"; do
      case $yn in
         Yes ) 
            if [ -d "$basketLocation" ]; then
               # Control will enter here if $DIRECTORY exists.
               if [ "$(ls -A $basketLocation)" ]; then
                  echo "$basketLocation"
                  rm -rfv "$basketLocation"/* 
               else 
                  echo "myWasteBasket is empty, exiting operation!!!"
               fi
            else 
               echo "The folder "$basketLocation" doesn't exist!"
               echo "Exiting operation!!!"
               exit 1
            fi
            break; ;;
         
         No )
            echo "Aborting operation"
            exit;;
      esac
   done
}


clearBasketMultiples () {
   echo "test"
}




