alias e="emacsclient -a false"
case "$OSTYPE" in
    linux*)
        alias emacs="TERM=xterm-24bit emacs"
        ;;
esac
