# Sane SSH_AUTH_SOCK handling for tmux, so that new SSH agents
# created by subsequent logons are still usable. From
# https://gist.github.com/admackin/4507371.
function _ssh_auth_save() {
    ln -sf "$SSH_AUTH_SOCK" "$HOME/.ssh/ssh-auth-sock.$HOSTNAME"
}
alias tmux='_ssh_auth_save ; export HOSTNAME=$(hostname) ; tmux'
