#!/bin/bash
echo "Enter the directory for which the number of files are to be found: "
read direc
if [ ! -d $direc ]
then 
echo "Invalid directory: "
else
cd $direc
echo "All the files in $direc are: "
for files in $(find . -type f)
do 
echo $files
done 
fi