#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
source_dir=$1
des_dir=$2
days=${3:-14} # if user is not passing days, we will take 14 days as default
usage(){
    echo -e "${R}USAGE:: $0 [SOURCE_DIR] [DES_DIR] [days(Optional, default to 14 days)]${N}"
    exit 1
}


if [ -z "$source_dir" ] || [ -z "$des-dir" ]; then
    echo "Either sour or destination dir is empty"
    usage
fi    

if [ ! -d "$source_dir" ]; then
    echo -e "${R}ERROR::Source Directory $source_dir does not exist${N}"
fi

if [ ! -d "$des_dir" ]; then
    echo -e "${R}ERROR:: Destination Directory  $des_dir does not exist${N}"
fi

echo "Scanning files older than $days in $source_dir"
files_to_archive=$(find $source_dir -name "*.log" -type f -mtime +$days)

if [ -z "$files_to_archive" ]; then
    echo "No log files found older than $days"
    exit 0
fi
timestamp=$(date +%Y-%m-%d-%H-%M-%S)
file_name="$des_dir/log-$timestamp.tar.gz"
tar -czf $file_name $files_to_archive
if [ $? -ne 0] ; then

    echo "logs Archieve failed $file_name"
    exit 1
else
    echo "logs are archived"

while IFS= read -r line
do
    echo "File is moved : $line"
    cp $line $des_dir
    rm -f $line
    echo "File deleted: $line"
done <<< "$files_to_archive"
fi

