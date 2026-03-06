#!/usr/bin/env bash
# Breadth-first search: check each directory at current depth for `name`
# Usage: find_top_file_bfs [dir] [name] [max_depth]
# - `dir` defaults to `.`
# - `name` defaults to `hec-hms.sh`
# - `max_depth` 0 = unlimited
find_top_file_bfs() {
    local dir=${1:-.}
    local name=${2:-hec-hms.sh}
    local max_depth=${3:-0}
    dir=${dir%/}

    local -a queue next
    queue=("$dir")
    local depth=0

    while [ ${#queue[@]} -gt 0 ]; do
        # 1) Check all directories at this depth for the file (fast: direct test)
        for d in "${queue[@]}"; do
            if [ -f "$d/$name" ]; then
                printf '%s\n' "$d/$name"
                return 0
            fi
        done

        # 2) Respect max_depth if set
        if [ "$max_depth" -gt 0 ] && [ "$depth" -ge "$max_depth" ]; then
            break
        fi

        # 3) Build next level: collect immediate subdirectories of current level
        next=()
        for d in "${queue[@]}"; do
            while IFS= read -r -d '' subdir; do
                next+=("$subdir")
            done < <(find "$d" -mindepth 1 -maxdepth 1 -type d -print0 2>/dev/null)
        done

        queue=("${next[@]}")
        depth=$((depth + 1))
    done
}

# load the function (adjust path if needed)
#source ./find-top-file-bfs.sh

# capture output
result=$(find_top_file_bfs res hec-hms.sh)
ret=$?

# print result or a not-found message
if [ $ret -eq 0 ] && [ -n "$result" ]; then
  printf '%s\n' "$result"
  chmod +x "$result"
  sh "$result"
else
  printf 'file not found\n' >&2
fi


