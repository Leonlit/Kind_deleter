#file for clearing the folder content

clearBasket () {
   arr=("$@") #getting the array of parameter
   printf "are you sure you want to delete all the files in myWasteBasket? \t"
   read $comfirm
   while true; do 
      case $comfirm in
         [Yn]* ) rm -rfv "$basketLocation"; break;;
         [Nn]* ) printf "Aborting operation! \n"; break;;
         * ) printf "Please answer [Y]es or [N]o.\n";;
      esac
   done

}  
