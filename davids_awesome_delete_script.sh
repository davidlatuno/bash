#!/bin/bash

for d in */ ; do
  if [ -d "$d/Solved" ]
  then
    rm -r "$d/Solved"
    echo "deleted ${d}Solved"
  fi
done
echo "All Done!"
exit 1
