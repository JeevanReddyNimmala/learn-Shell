#!bin/bash

echo " speacial aruements passed at:$@"
echo " no of arguments passed: $#"
echo "first varaiable passed:$1"
echo "script name:$0"
echo "who is running the script: $user"
echo "Path of the script: $(realpath $0)"
