#!bin/bash
user_id=$(id -u)

if [ $user_id ne 0 ] ; then
echo " Run this with SUDO access"
fi
dnf install nginx -y