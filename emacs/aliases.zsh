# alias e="TERM=xterm-direct emacsclient -a false"
case "$OSTYPE" in
    linux*)
        alias e="TERM=xterm-direct emacsclient"
        alias emacs="TERM=xterm-direct emacs"
        ;;
    darwin*)
        alias e="TERM=xterm-24bit emacsclient"
        alias emacs="TERM=xterm-24bit emacs"
        ;;
esac
