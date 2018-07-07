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

convert_mp3(){
    echo "Converting $1 to $2"
    ffmpeg -i $1 -ac 2 -ab 320k $2
}

check_port(){
    lsof -n -i:$1 | grep LISTEN
}

# gets the BurstCreditBalance of the OTMS EFS 
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

# open the github repo
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

# get the estimated billing for AWS
function aws.billing() {
    aws --region us-east-1 --profile steve cloudwatch get-metric-statistics \
        --namespace "AWS/Billing" \
        --metric-name "EstimatedCharges" \
        --dimension "Name=Currency,Value=USD" \
        --start-time `date -v-12H -u '+%FT%TZ'` \
        --end-time $(date +"%Y-%m-%dT%H:%M:00") \
        --statistic Maximum \
        --period 60 | jq '.Datapoints[0] | .Maximum'
}

# encode the string for a url
urlencode() {
  python -c 'import urllib, sys; print urllib.quote(sys.argv[1], sys.argv[2])' \
    "$1" "$urlencode_safe"
}

# cheat sheet of programming help
# usage: cheatsheet [programming language] "topic"
# cheatsheet python "insert into dictionary"
function cheatsheet(){
  encoded=$(urlencode "${@:2}")
  curl cht.sh/$1/${encoded}
}

_fzf_pass_completion()
  #if PASSWORD_STORE_DIR is not set use ~/.password-store/
  local pwdir=${PASSWORD_STORE_DIR-~/.password-store/}
