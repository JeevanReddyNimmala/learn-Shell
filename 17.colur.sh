#!bin/bash
user_id=$(id -u)
log_folder="/var/log/shell_practice"
log_file="${log_folder}/${0}.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $user_id -ne 0 ] ; then
    echo "Run this with SUDO access"
    exit 1
fi

mkdir -p $log_folder
echo  "script started ececution at $(date +"%F %T")"

validate (){
    if [ $1 -ne 0 ] ; then
    echo  -e "${2} ...{$R}FAILED{$N}" | tee -a $log_file
    exit 1
else
    echo  -e "${2} .. {$G}SUCCUSS{$N}" | tee -a $log_file
fi
}

for package in $@
do
    dnf list intsalled $package &>> $log_file
    if [ $? -ne 0 ]; then
    echo "going to istall ${package}"
    dnf install ${package} -y &>> $log_file
    echo "dnf install ${package} -y &>> $log_file"
    validate $? "intalling ${package}"
    else
    echo "$package already insttalled....{$Y}SKIPPING{$N}"
    fi
done
 
echo "script completed ececution at $(date +"%F %T")"

echo "$log_folder"
echo "$log_file"
