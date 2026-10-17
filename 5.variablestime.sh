#!/bin/bash
start_time=$(date +%s)
end_time=$(date +%s)

echo "script statred execution at :$start_time";
sleep 30;
echo "script completed excecution at :$end_time";
total_time=$(($end_time-$start_time))
echo  "total time taken :$total_time ";


