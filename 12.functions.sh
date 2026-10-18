#!bin/bash
user_id=$(id -u)

if [ $user_id -ne 0 ] ; then
    echo "Run this with SUDO access"
    exit 1
fi

Validate (){
    if [ $1 -ne 0 ] ; then
    echo "${2} failed"
    exit 1
else
    echo "{2} sucess"

}
fi

echo "Proceed"

dnf install nginx -y

Validate $? "Nginx Installation"

dnf install mysql -y

Validate $? "Mysql Installation"


echo "still proceeding"
