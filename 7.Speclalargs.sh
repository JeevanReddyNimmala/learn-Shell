#!bin/bash

echo " speacial aruements passed at:$@"
echo " no of arguments passed: $#"
echo "first varaiable passed:$1"
echo "script name:$0"
echo "who is running the script: $USER"
echo "Path of the script: $(realpath $0)"
echo  "present direcrory of the scripr $PWD"
echo "home path of the current script $HOME"
echo "PID of the current script: $$ "