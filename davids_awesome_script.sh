#!/bin/bash

# Check if solved folder exists

FOLDER=${1}

for d in */ ; do
  if [ -d "$d/Solved" -a -d "../../../../UCSD201807FSF5/$FOLDER/01-Activities/$d" -a ! -d "../../../../UCSD201807FSF5/$FOLDER/01-Activities/$d/Solved" ]
  then
    cp -r "$d/Solved" ../../../../UCSD201807FSF5/$FOLDER/01-Activities/$d
    # echo "Directory $d'Solved' exists and $d exists in gitlab."
  fi
done
