
case "$OSTYPE" in
    darwin*)
        export PATH="/usr/local/sbin:$ZSH/bin:$PATH"
        export MANPATH="/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"
        ;;
    *)
        export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:$ZSH/bin:$PATH"
        export GPG=gpg2
        ;;
esac
