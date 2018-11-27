#!/bin/bash
#created on November16,'2018
#This script creates folders in the path which is entered by the user.The path where the folder has to be made is given by the user.
#The user also enters the initial half name that is permanent in all the folders that have to be created and the range for the 2nd half.
#The concatenated name is then used for the new folders and if the name already exists, an error message is displayed. 
#Inside every new folder created,an empty file named .stfolder is created. 


read -p "enter folder path:" folder_path  #to get the input of the path where the folder has to be made
read -p "enter initial fixed name:" name  #to get the first half of the folder name that is fixed
read -p "enter the lower limit:" ll       #to get input for the lower limit of the range
read -p "enter the upper limit:" ul       #to get input for the upper limit of the range
for (( i= ll ; i<=ul ; i++))
do
  newname="$name$i"                       #concatenation of the first and last name of the folder
  if [ -d "$folder_path/$newname" ]       #if the name already exists for any other folder
  then
    echo "Directory " "$newname" " already exists"  #warning displayed if name already exists
  else                                              #if name does not exist
    mkdir -p "$folder_path/$newname" && touch "$folder_path/$newname/.stfolder"    #to make the folder and create an empty file inside it
  fi
done



