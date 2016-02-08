#!/bin/sh

# Helps with the slow tab completion of git repos
__git_files () {
    _wanted files expl 'local files' _files  }

cd() { builtin cd "$@"; ls -alh; }          # Always list directory contents upon 'cd'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels

# Searches in the current director for a file
# Usage: fname steve
function fname(){
    find . -iname "*$@*"
}

ds(){
  echo "Disk Space Utilization For $HOSTNAME"
  df -h
}

convert_mp3(){
    echo "Converting $1 to $2"
    ffmpeg -i $1 -ac 2 -ab 320k $2
}
