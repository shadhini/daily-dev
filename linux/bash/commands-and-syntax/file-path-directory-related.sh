#!/usr/bin/env bash

# Extract the file name from a full path
HEC_HMS_LOCAL_PACKAGE_PATH="/Users/a bc/Projects/daily-dev/res/find-top-file-bfs/HEC-HMS-4.13-linux64.zip"
filename="$(basename -- "$HEC_HMS_LOCAL_PACKAGE_PATH")"
printf '%s\n' "$filename"
FILE_PATH=/tmp/setup/"$(basename -- "$HEC_HMS_LOCAL_PACKAGE_PATH")"
printf '%s\n' "$FILE_PATH"
FILE_PATH="/Users/abc/Projects/daily-dev/linux/bash-commands/res/HEC-HMS-4.13-linux64.zip"
FILE_TYPE=$(file -b "$FILE_PATH")
printf '%s\n' "$FILE_TYPE"


# Extract the directory path from a full path
directory="$(dirname -- "$HEC_HMS_LOCAL_PACKAGE_PATH")"
printf '%s\n' "$directory"


# current directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
printf '%s\n' "$SCRIPT_DIR"
printf '%s\n' "$PROJECT_ROOT"
