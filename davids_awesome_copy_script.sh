#!/bin/bash

# Get Basename
PWD=`pwd`
NAME=`basename $PWD`

# Move into Activities Folder
cd 01-Activities

# For All Activities get the solved (do logic to see if copying is necessary/possible) and copy it to gitlab folder
for d in */ ; do
  if [ -d "$d/Solved" -a -d "../../../../UCSD201807FSF5/$NAME/01-Activities/$d" -a ! -d "../../../../UCSD201807FSF5/$NAME/01-Activities/$d/Solved" ]
  then
    cp -r "$d/Solved" ../../../../UCSD201807FSF5/$NAME/01-Activities/$d
  fi
done
