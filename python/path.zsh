case "$OSTYPE" in
    darwin*)
        if [[ $(uname -m) != 'arm64' ]]; then
            export PATH=/usr/local/opt/python@3.9/libexec/bin:${PATH}
        fi
        ;;
    *)
        # python->python3, pip->pip3, etc...
        export PATH=/home/linuxbrew/.linuxbrew/opt/python@3.9/libexec/bin:${PATH}
esac
