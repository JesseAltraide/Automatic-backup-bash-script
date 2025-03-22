#!/bin/bash

#have a current date variable
#going to use the rsync stuff to back up files
#check if directory exists
#what if the user doesnt have rsync
#rsync has to copy files that the user specifies and put it into a particular file specifically for it#
#ensure that the user passes one argument
#the rsync options are -avb --backupdir backup/source --delete

current_date=$(date +%Y-%m-%d)

if [ -z $1 ]
then
    echo "No directory was entered"
    exit 1
fi

if [ -d $1 ]
then
    echo "Directory doesn't exist"
    exit 2
fi

if ! command -v rsync &>/dev/null
then
    echo "rsync not installed run the command 'sudo apt install rsync' to install it"
    exit 3
fi

mkdir -p "backup/$1/$current_date"

rsync_options="-avb --backup-dir=backup/$1/$current_date --delete --dry-run"

rsync $rsync_options "$1" "backup/$1" >> backup_$current_date.log
