#!/bin/bash

#ask user for which script they want to back up
#can you copy just one file.
#create a temp directory file
#copy the file from one place to another maybe a temp file 

if [ ! -d "/temp" ]
then
    sudo mkdir /temp
fi

if [ -z $1 ]
then
    echo "No input"
    read -p "Enter a filename: " filename
else
    filename=$1
fi

if [ ! -f $filename ]
then
    echo "ERROR, the file does not exist"
fi

sudo cp $filename /temp
