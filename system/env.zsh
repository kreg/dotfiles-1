# fix less to use raw characters, exit immediately if less than a page 
export LESS=RFX

# Seems to be necessary to set LC_ALL on OSX for blackbox_postdeploy
case "$OSTYPE" in
    darwin*)
        export LC_ALL=$LANG
        ;;
esac
