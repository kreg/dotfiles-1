# write everything I do to ~/.logs/zsh-history
preexec() {
    echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $1" >> ~/.logs/zsh-history-$(date "+%Y-%m-%d").log;
}

function print-path() {
    for x in ${(@s/:/)PATH}; do echo $x; done
}

function jwt() {
    t=$1
    t=${t#*.}
    t=${t%.*}
    p=$(echo $t | base64 -D)
    p="${p}\"}"
    echo $p | jq
}

# use to pull out the nth word
param(){ awk ${2:+-F "$2"} "{print \$$1}"; }
