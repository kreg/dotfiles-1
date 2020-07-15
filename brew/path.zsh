case "$OSTYPE" in
    darwin*)
    ;;
    *)
        eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
        ;;
esac
