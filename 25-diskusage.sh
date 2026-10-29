#!bin/bash

disk_usage=$(df -hT | grep -v Filesystem)
usage_threeshold=20
server_ip=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)
while IFS= read -r line
do
    usage=$(echo $line | awk '{print $6}' | cut -d '%' -f1)
    partition=$(echo $line | awk '{print $7}')
if [ "$usage" -ge "$usage_threeshold" ]; then
     message+=$(echo -e "High Disk utilaisation on $partition:$usage \n")
fi  

done <<< "$disk_usage"

echo -e "$message"

sh 26-mail.sh "Devops_Team" "$server_ip" "High Disk Usage" "$message" "jeevanreddydotcom@gmail.com" "WARNING:High Disk Usage Alert!"


