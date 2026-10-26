#!bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

source_dir=$1
days=${2:-14} #if user doesn pass any days it will take 14days as default

usage(){
    echo -e "USAGE :: ${R} [SOURCE_DIR] [days(optional default 14days)]${N}"
    exit 1
}

if [ -z "$source_dir" ] ; then
    echo "ERROR :: Missing parameter"
    usage
fi

if [ ! -d "$source_dir" ] ; then
    echo -e "ERROR :: ${R} "$source_dir" directory does not exists${N}"
fi

echo "Scaning files older than " $days" in "$source_dir" directory"

files_to_delete=$(find $source_dir -name "*.log" -type f -mtime +$days)

echo "$files_to_delete"

if [ -z "$files_to_delete" ]; then
    echo "No log files found older than +$days"  
    exit 0
fi

while IFS= read -r line 
do
    echo "File is goining to be deleted : $line"
done <<< "$fileS_to_delete"

