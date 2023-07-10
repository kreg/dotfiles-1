
case "$OSTYPE" in
    darwin*)
        if [[ $(uname -m) == 'arm64' ]]; then
            export PATH="/opt/homebrew/sbin:$ZSH/bin:$PATH"
            export MANPATH="/opt/homebrew/man:$MANPATH"
        else
            export PATH="/usr/local/sbin:$ZSH/bin:$PATH"
            export MANPATH="/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"
        fi
        ;;
    *)
        export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:$ZSH/bin:$PATH"
        ;;
esac
