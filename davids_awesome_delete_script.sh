#!/bin/bash

for d in */ ; do
  if [ -d "$d/Solved" ]
  then
    rm -r "$d/Solved"
    # echo "Directory $d'Solved' exists."
  fi
done
