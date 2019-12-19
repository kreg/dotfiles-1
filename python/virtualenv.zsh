export PROJECT_HOME=$HOME/src
export WORKON_HOME=$HOME/.virtualenvs
case "$OSTYPE" in
    darwin*)
        source $HOME/Library/Python/2.7/bin/virtualenvwrapper.sh
        ;;
esac
