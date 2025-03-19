#!/bin/bash

#get file from user as an argument
real=$(realpath $1 2> error.log)
dir=$(dirname $real 2>error.log)

#Check if $1 is empty
if [ -z $1 ] 
then
    echo "No argument passed" 
    
else
#run the dirman and realpath command against the argument and then give an echo of the directory of the file
    echo = "The directory of the $1 file is $dir"
fi
