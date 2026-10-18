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
sleep 10 &
echo "show the PID of the bachkground running procees:$!"
wait $! ## wait till $! command execution
echo "Line number:$LINENO"
echo "show the exit status of last command : $?"
echo " show the time taken to complete the script:$SECONDS"