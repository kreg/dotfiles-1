# alias e="TERM=xterm-direct emacsclient -a false"
alias e="TERM=xterm-direct emacsclient"
case "$OSTYPE" in
    linux*)
        alias emacs="TERM=xterm-direct emacs"
        ;;
esac
