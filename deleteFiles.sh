#file for moving files into the basket

deleteFiles() {
   while [ $# -eq 1 ]; do
      tempName="${basketLocation}/"$1""
      counter=0
      
      if [ -f "$1" ]; then
         while [ -f "$tempName" ]; do
            tempName=""${basketLocation}"/"$1"("$counter")"
            let "counter++"
         done
      else
         while [ -d "$tempName" ] || [ -f "$tempName" ]; do
            tempName=""${basketLocation}"/"$1"("$counter")"
            let "counter++"
         done
      fi
         
      if [ -d $1 ]; then
         mv  -v "$1" "$tempName"
      else
         mv "$1" "$tempName"
      fi
      shift
   done
}
