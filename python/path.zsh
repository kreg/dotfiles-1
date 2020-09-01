case "$OSTYPE" in
    darwin*)
        export PATH=${HOME}/Library/Python/2.7/bin:${PATH}
        ;;
    *)
        # python->python3, pip->pip3, etc...
        export PATH=/home/linuxbrew/.linuxbrew/opt/python@3.8/libexec/bin:${PATH}
esac
