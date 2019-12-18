autoload colors && colors
# cheers, @ehrenmurdick
# http://github.com/ehrenmurdick/config/blob/master/zsh/prompt.zsh

if (( $+commands[git] ))
then
    git="$commands[git]"
else
    git="/usr/bin/git"
fi

user_and_host_name() {
    echo "%{$fg[red]%}%n%{$fg[white]%}@%{$fg[green]%}%m%{$reset_color%}"
}

directory_name() {
    echo "%{$fg[blue]%}%~%{$reset_color%}"
}

git_status () {
    local repo_info
    repo_info="$(git rev-parse --git-dir --is-inside-git-dir \
                 --is-bare-repository --is-inside-work-tree \
                 --short HEAD 2>/dev/null)"
    if [[ -n "$repo_info" ]]; then
        ref=$($git symbolic-ref HEAD 2>/dev/null)
        git diff --no-ext-diff --quiet || w="*"
        git diff --no-ext-diff --cached --quiet || w="*"
        echo "%{$fg[yellow]%}(${ref#refs/heads/}${w})%{$reset_color%}"
    fi
}

the_time () {
    echo "%{$fg[cyan]%}%*%{$reset_color%}"
}

# Prints the current kubectl context if applicable
kube_prompt() {
    local context ns
    if [[ ! $(kubectl config view | grep "contexts: null") ]]; then
        context="$(kubectl config current-context 2>/dev/null)"
        echo "%{$fg_bold[magenta]%}${context}%{$reset_color%}"
    fi
}

export PROMPT=$'$(user_and_host_name):$(directory_name) $(git_status) $(the_time)\n%# '
