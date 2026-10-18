#!bin/bash

echo "Please enter marks"
read marks
## -lt means less than

if [ $marks -lt 35 ]; then
echo "Fail"
elif [ $marks -lt 50 ]; then
echo "Third Class"
elif [ $marks -lt 60 ]; then
echo "Second Class"
elif [ $marks -lt 75 ];  then
echo "First Class"
else
echo "Distintion"

fi

echo "End"