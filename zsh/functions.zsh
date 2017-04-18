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

check_port(){
    lsof -n -i:$1 | grep LISTEN
}

# Gets the BurstCreditBalance of the OTMS EFS 
otms.efs() {
    CREDITS=$(aws cloudwatch --profile otms --region us-east-1 \
        get-metric-statistics --namespace "AWS/EFS" \
        --metric-name "BurstCreditBalance" \
        --statistics Average \
        --start-time `date -v-60M -u '+%FT%TZ'` \
        --end-time `date -u '+%FT%TZ'` \
        --period 60 \
        --dimensions Name=FileSystemId,Value=fs-8ec916c7 | jq '.Datapoints[0] | .Average')
    echo "${CREDITS} bytes"
    gunits ${CREDITS}B TB
}

function GithubRepo() {
    if [ ! -d .git ] ;
        then echo "ERROR: This isn't a git directory" && return false;
    fi
    git_url=`git config --get remote.origin.url`
    if [[ $git_url != git@github.com:* ]] ;
        then echo "ERROR: Remote origin is invalid" && return false;
    fi
    url=${git_url%.git}
    if [[ $url == git@github.com:* ]] ;
        then url=$(echo $url | sed 's,git@github.com:,https://github.com/,g')
    fi
    open $url
}
