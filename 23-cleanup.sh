#!bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

source_dir=$1
days=${$2:-14} #if user doesn pass any days it will take 14days as default

usage(){
    echo -e "USAGE :: ${R} [SOUTCE_DIR] [days(optional default 14days)]${N}"
}

if [ -z "$source_dir" ] ; then
    echo "ERROR :: Missing parameter"
    usage
fi