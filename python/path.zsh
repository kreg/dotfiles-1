case "$OSTYPE" in
    darwin*)
        export PATH=/usr/local/opt/python@3.9/libexec/bin:${PATH}
        ;;
    *)
        # python->python3, pip->pip3, etc...
        export PATH=/home/linuxbrew/.linuxbrew/opt/python@3.8/libexec/bin:${PATH}
esac
