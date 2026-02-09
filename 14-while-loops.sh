#!/bin/bash

# while read LINE 
# do
#     echo $LINE
# done < 13-delete-old-logs.sh




while IFS= read -r line
do
  # Process the line (here we just print it)
  echo "Line: $line"
done < "$INPUT_FILE"

echo "Finished reading file."    











