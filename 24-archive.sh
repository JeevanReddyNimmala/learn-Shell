#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
source_dir=$1
des_dir=$2
days=${3:-14} # if user is not passing days, we will take 14 days as default
usage(){
    echo -e "${R}USAGE:: $0 [SOURCE_DIR] [DES_DIR] [days(Optional, default to 14 days)]${N}"
    exit 1
}


if [ -z "source_dir"] || [ -z "des-dir" ] ; then
    echo "Either sour or destination dir is empty"
    usage
fi    

if [ ! -d "$source_dir" ]; then
    echo -e "${R}ERROR::Source Directory $source_dir does not exist${N}"
fi

if [ ! -d "$des_dir" ]; then
    echo -e "${R}ERROR:: Destination Directory  $des_dir does not exist${N}"
fi
