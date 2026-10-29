#!bin/bash

disk_usage=$(df -hT | grep -v Filesyestem)
usage_threeshold=20
while IFS= read -r line
do
    usage=$(echo $line | awk '{print $6}' | cut -d '%' -f1)
    partition=$(echo $line | awk '{print $7}')
if [ "$usage" -ge "$usage_threeshold"  ]; then

     message+="High Disk utilaisation on "$partition":"$usage"  \n" 
fi  

done <<< "$disk_usage"

echo "$message"