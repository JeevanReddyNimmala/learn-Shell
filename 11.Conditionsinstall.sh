#!bin/bash
user_id=$(id -u)

if [ $user_id -ne 0 ] ; then
echo "Run this with SUDO access"
exit 1
fi
echo "Proceed"
dnf install nginx -y