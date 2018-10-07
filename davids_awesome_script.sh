#!/bin/bash

# Check if solved folder exists
for d in */ ; do
  if [ -d "$d/Solved" ]
  then
      echo "Directory $d/Solved exists."
  else
      echo "Error: Directory $d/Solved does not exist."
  fi
done
