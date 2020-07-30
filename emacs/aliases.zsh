case "$OSTYPE" in
    darwin*)
        alias e="emacsclient -a false"
        ;;
    *)
        alias e="TERM=xterm-24bit emacsclient -a false"
        ;;
esac
