case "$OSTYPE" in
    darwin*)
        export GOROOT=/usr/local/opt/go/libexec
        export GOPATH=$HOME/go
        export PATH="$GOPATH/bin:$PATH"
        ;;
    *)
        export PATH=$PATH:/usr/local/go/bin
        ;;
esac
