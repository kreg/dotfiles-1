autoload colors && colors
# cheers, @ehrenmurdick
# http://github.com/ehrenmurdick/config/blob/master/zsh/prompt.zsh

if (( $+commands[git] ))
then
    git="$commands[git]"
else
    git="/usr/bin/git"
fi

prompt_user_and_host_name() {
    echo "%{$fg[red]%}%n%{$fg[white]%}@%{$fg[green]%}%m%{$reset_color%}"
}

prompt_directory_name() {
    # light sea green
    echo "%F{#20b2aa}%~%f"
}

prompt_git_status () {
    local repo_info
    repo_info="$(git rev-parse --git-dir --is-inside-git-dir \
                 --is-bare-repository --is-inside-work-tree \
                 --short HEAD 2>/dev/null)"
    if [[ -n "$repo_info" ]]; then
        ref=$($git symbolic-ref HEAD 2>/dev/null)
        git diff --no-ext-diff --quiet || w="*"
        git diff --no-ext-diff --cached --quiet || w="*"
        # goldenrod
        echo "%F{#daa520}(${ref#refs/heads/}${w})%f"
    fi
}

prompt_current_time () {
    echo "%F{magenta}%*%f"
}

# Prints the current kubectl context if applicable
kube_prompt() {
    local context ns
    if [[ ! $(kubectl config view | grep "contexts: null") ]]; then
        context="$(kubectl config current-context 2>/dev/null)"
        echo "%{$fg_bold[magenta]%}${context}%{$reset_color%}"
    fi
}

prompt_success() {
    echo '%(?.%F{#90ee90}✓.%F{red}✕)%f'
}

# Turns seconds into human readable time.
# 165392 => 1d 21h 56m 32s
# https://github.com/sindresorhus/pretty-time-zsh
prompt_pure_human_time_to_var() {
    local human total_seconds=$1 var=$2
    local days=$(( total_seconds / 60 / 60 / 24 ))
    local hours=$(( total_seconds / 60 / 60 % 24 ))
    local minutes=$(( total_seconds / 60 % 60 ))
    local seconds=$(( total_seconds % 60 ))
    (( days > 0 )) && human+="${days}d "
    (( hours > 0 )) && human+="${hours}h "
    (( minutes > 0 )) && human+="${minutes}m "
    human+="${seconds}s"

    # Store human readable time in a variable as specified by the caller
    typeset -g "${var}"="${human}"
}

# Stores (into prompt_pure_cmd_exec_time) the execution
# time of the last command if set threshold was exceeded.
prompt_pure_check_cmd_exec_time() {
    integer elapsed
    (( elapsed = EPOCHSECONDS - ${prompt_pure_cmd_timestamp:-$EPOCHSECONDS} ))
    typeset -g prompt_pure_cmd_exec_time=
    (( elapsed > ${PURE_CMD_MAX_EXEC_TIME:-2} )) && {
	prompt_pure_human_time_to_var $elapsed "prompt_pure_cmd_exec_time"
    }
}

prompt_pure_preexec() {
    typeset -g prompt_pure_cmd_timestamp=$EPOCHSECONDS
}

prompt_pure_precmd() {
    # Check execution time and store it in a variable.
    prompt_pure_check_cmd_exec_time
    unset prompt_pure_cmd_timestamp
}

prompt_exec_time() {
    # [[ -n $prompt_pure_cmd_exec_time ]] && echo '%F{brown}${prompt_pure_cmd_exec_time}%f'
    echo "%F{#eedd82}${prompt_pure_cmd_exec_time}%f"
}

prompt_setup() {
    zmodload zsh/datetime
    autoload -Uz add-zsh-hook
    add-zsh-hook preexec prompt_pure_preexec
    add-zsh-hook precmd prompt_pure_precmd
    export PROMPT=$'$(prompt_success) $(prompt_current_time) $(prompt_exec_time)\n$(prompt_user_and_host_name):$(prompt_directory_name) $(prompt_git_status) \n%{$(iterm2_prompt_mark)%} '
}

prompt_setup
