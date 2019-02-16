#!/bin/bash

# Get Basename
PWD=`pwd`
NAME=`basename $PWD`

# Users first input to define start of range
START=$1
# Users second input to define end of range
END=$2
# Directory index variable
INDEX=0
# Array to hold user input range
declare -a arr

# Exit if only one argument passed
if [ $# -eq 1 ]
  then
    echo "Not Enough Arguments Supplied"
    exit 1
fi

# Exit if too many arguments passed
if [[ $# > 2 ]]
  then
    echo "Too Many Arguments Supplied"
    exit 1
fi

if (( $START > $END ))
  then
    echo "Not a Valid Range"
    exit 1
fi

# Copy all the folders if no arguments passed
if [ $# -eq 0 ]
  then
    # Move into Activities Folder
    cd 01-Activities

    # For All Activities get the solved (do logic to see if copying is necessary/possible) and copy it to gitlab folder
    for d in */ ; do
      if [ -d "$d/Solved" -a -d "../../../../UCSD201902FSF3/$NAME/01-Activities/$d" -a ! -d "../../../../UCSD201902FSF3/$NAME/01-Activities/$d/Solved" ]
      then
        cp -r "$d/Solved" ../../../../UCSD201902FSF3/$NAME/01-Activities/$d
        echo "${d}Solved copied over"
      fi
    done
    echo "All Done!"
    exit 1
fi

# Push user range into array
for ((i=$START;i<=$END;i++)); do
  arr+=($i)
done

# Move into Activities Folder
cd 01-Activities

# For All Activities get the solved (do logic to see if copying is necessary/possible) and copy it to gitlab folder
for d in */ ; do
  # Iterate through the user defined a range of directories
  for ((i=0;i<${#arr[@]};i++)); do
    # If this folder is in the range of user input
    if [ "$((INDEX+1))" == "${arr[$i]}" ] ; then
      # logic to see if copying is necessary/possible
      if [ -d "$d/Solved" -a -d "../../../../UCSD201902FSF3/$NAME/01-Activities/$d" -a ! -d "../../../../UCSD201902FSF3/$NAME/01-Activities/$d/Solved" ]
      then
        cp -r "$d/Solved" ../../../../UCSD201902FSF3/$NAME/01-Activities/$d
        echo "${d}Solved copied over"
      fi
    fi
  done
  # Increment directory index variable
  INDEX=$((INDEX+1))
done
echo "All Done!"
exit 1
