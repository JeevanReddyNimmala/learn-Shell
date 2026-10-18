#!bin/bash
user_id=$(id -u)

if [ $user_id -ne 0 ] ; then
    echo "Run this with SUDO access"
    exixxt 1
fi

echo "Proceed"
dnf install nginxxx -y
if [ $? -ne 0 ] ; then
    echo "nginx installation failed"
    exit 1
else
    echo "nginx installation sucess"
fi

dnf install mysql -y
if [ $? -ne 0 ] ; then
    echo "mysql installation failed"
    exit 1
else
    echo "Mysql installation complete"
fi

echo "still proceeding"
