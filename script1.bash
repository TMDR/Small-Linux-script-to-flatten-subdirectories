#!/bin/bash
while [[ $ToCopy != *".txt" ]]
do
read -p "give the text's path that contain filenames in root and its subfolders to copy: " ToCopy
done

echo "give the directory where you want to copy those files"
read destination
 
text=`cat $ToCopy`

while [[ $text == *","* ]]
do
	path=`sudo find /root/ -type f -name ${text%%,*}`
	echo $path
	sudo cp $path $destination
	echo 
 	text=${text#*,}
done
	path=`sudo find /root/ -type f -name ${text%%,*}`
	sudo cp $path $destination

