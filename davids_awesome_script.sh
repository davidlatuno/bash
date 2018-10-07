#!/bin/bash

# Lists user input
# NAME=${1}
# echo $NAME

# Lists directory names in current directory (Basically ls)
# for d in */ ; do
#     echo "$d"
# done

# Check if solved folder exists
for d in */ ; do
  if [ -d "$d/Solved" ]
  then
      echo "Directory $d/Solved exists."
  else
      echo "Error: Directory $d/Solved does not exist."
  fi
done
