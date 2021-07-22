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
            mv -v "$1" "$tempName"
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
