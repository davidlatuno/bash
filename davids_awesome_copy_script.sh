#!/bin/bash

START=$1
END=$2
INDEX=0
declare -a arr
for ((i=$START;i<=$END;i++)); do
  arr+=($i)
done

# Get Basename
PWD=`pwd`
NAME=`basename $PWD`

# Move into Activities Folder
cd 01-Activities

# For All Activities get the solved (do logic to see if copying is necessary/possible) and copy it to gitlab folder
for d in */ ; do
  # Iterate through the user defined a range of directories
  for ((i=0;i<=${#arr[@]};i++)); do
    # If this folder is in the range of user input
    if [ "$((INDEX+1))" == "${arr[$i]}" ] ; then
      # logic to see if copying is necessary/possible
      if [ -d "$d/Solved" -a -d "../../../../UCSD201807FSF5/$NAME/01-Activities/$d" -a ! -d "../../../../UCSD201807FSF5/$NAME/01-Activities/$d/Solved" ]
      then
        cp -r "$d/Solved" ../../../../UCSD201807FSF5/$NAME/01-Activities/$d
      fi
    fi
  done
  # Increment directory index variable
  INDEX=$((INDEX+1))
done
