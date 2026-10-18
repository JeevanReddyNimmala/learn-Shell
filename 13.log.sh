#!bin/bash
user_id=$(id -u)
log_folder="/var/log/shell_practice"
log_file="${log_folder}/{0}.log"

if [ $user_id -ne 0 ] ; then
    echo "Run this with SUDO access"
    exit 1
fi

mkdir -p $log_folder
echo "script started ececution at $(date +"%F %T")"

Validate (){
    if [ $1 -ne 0 ] ; then
    echo "${2} ...FAILED" | tee -a $log_file
    exit 1
else
    echo "${2} SUCCUSS" | tee -a $log_file
fi
}


echo "Proceed"

dnf install nginx -y &>> $log_file

Validate $? "Nginx Installation"

dnf install mysql -y &>> $log_file

Validate $? "Mysql Installation"

echo "script completed ececution at $(date +"%F %T")"

echo "$log_folder"
echo "log_file"
