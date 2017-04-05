#!/bin/bash
# PURPOSE: Reformat the log files

# http://stackoverflow.com/questions/17998978/removing-colors-from-output
# http://unix.stackexchange.com/questions/14684/removing-control-chars-including-console-codes-colours-from-script-output

# Script's directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";


# Open each log file in directory "logs"
# Replace [32m, [0m[0m[32m, [32m[1m, [0m, [36m, [31m with nothing

while IFS= read -r line
do
    case "$line" in
       *[32m*) printf "%s\n" "${line/[32m/ }" ;;
       *) printf "%s\n" "$line" ;;
    esac
done < input.txt