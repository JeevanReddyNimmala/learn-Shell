#!bin/bash

var1=10
var2=20
var3=jeevan

echo "$var1+$var2"
echo "Total=$(($var1+$var2+$var3))"
declare -i COUNT=5 ## declaring as intiger
COUNT=COUNT+1
echo "Count is $COUNT"
FRUITS=("Apple" "Banana" "pappaya")
echo "Fruits are ${FRUITS[@]}"
echo "First Fruit ${FRUITS[0]}"
echo "Second Fruit ${FRUITS[2]}"
echo "Third Fruit ${FRUITS[2]}"
