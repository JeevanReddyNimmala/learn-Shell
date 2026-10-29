#!bin/bash

disk_usage=$(df -hT | grep -v Filesyestem)
usage_threeshold=20
while IFS= read -r line
do
    usage=$($line | awk '{print $6}' | cut -d '%' -f1)
    partition=$($line | awk '{print $7}')
if [ "$usage" -ge $"usage_threeshold"  ]; then
     echo "High Disk utilaisation on "$partition":"$usage""
fi  

done <<< "$disk_usage"