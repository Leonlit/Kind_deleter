#file for moving files into the basket

deleteFiles() {
   while [ $# -gt 0 ]; do
      echo "deleting file "$1""      
      tempName="${basketLocation}/"$1""
      counter=0
      
      if [ -f "$1" ] || [ -d "$1" ]; then
         while [ -f "$tempName" ] || [ -d "$tempName" ];  do
            tempName=""${basketLocation}"/"$1"("$counter")"
            let "counter++"
         done 
      fi

      if [ -d "$1" ]; then
         mv  -v "$1" "$tempName"
      else
         echo "$tempName"
         mv "$1" "$tempName"
      fi
      shift
   done
}
