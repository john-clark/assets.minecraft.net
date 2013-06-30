#!/bin/bash
curl -s "http://assets.minecraft.net" >assets.minecraft.xml
read_dom () {
    local IFS=\>
    read -d \< ENTITY CONTENT
}
if ! [ -f assets ]; then
  echo 'mkdir assets' >mirror.sh
fi
while read_dom; do
    if [[ $ENTITY = Key ]]; then
      case $CONTENT in
      */)
          echo 'mkdir assets/'$CONTENT
          ;;
      *)
          echo 'curl -s http://s3.amazonaws.com/assets.minecraft.net/'$CONTENT' -o assets/'$CONTENT
          ;;
      esac
    fi
done < assets.minecraft.xml >>mirror.sh
#rm assets.minecraft.xml
chmod +x mirror.sh
read -p 'Do you want to start the mirror now? [yn] ' a
if [[ $a = y ]] ; then
  mirror.sh
else
  echo 'Run mirror.sh' to get the files
fi
