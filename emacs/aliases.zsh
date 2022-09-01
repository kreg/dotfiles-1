# case "$OSTYPE" in
#     linux*)
#         alias e="TERM=xterm-direct emacsclient"
#         alias emacs="TERM=xterm-direct emacs"
#         ;;
#     darwin*)
#         alias e=emacsclient
#         # alias e="TERM=xterm-24bit emacsclient"
#         # alias emacs="TERM=xterm-24bit emacs"
#         ;;
# esac
case "$OSTYPE" in
    linux*)
           alias e="COLORTERM=truecolor emacsclient"
           alias emacs="COLORTERM=truecolor emacs"
           ;;
    darwin*)
            alias e=emacsclient
        ;;
esac
