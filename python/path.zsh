case "$OSTYPE" in
    darwin*)
        export PATH=/usr/local/opt/python@3.9/libexec/bin:${PATH}
        ;;
    *)
        # python->python3, pip->pip3, etc...
        export PATH=/home/linuxbrew/.linuxbrew/opt/python@3.9/libexec/bin:${PATH}
esac

if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi
