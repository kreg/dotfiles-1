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
  if $(! $git status -s &> /dev/null)
  then
      echo ""
  else
      ref=$($git symbolic-ref HEAD 2>/dev/null)
      git diff --no-ext-diff --quiet || dirty="*"
      echo "%{$fg[yellow]%}(${ref#refs/heads/}${dirty})%{$reset_color%}"
  fi
}

the_time () {
    echo "%{$fg[cyan]%}%*%{$reset_color%}"
}

# Prints the current kubectl context if applicable
kube_prompt() {
  local context ns
  if [[ $(kubectl config view | grep "contexts: null") ]]
  then
    echo ""
  else
    context="$(kubectl config current-context 2>/dev/null)"
    ns="$(kubectl config view -o "jsonpath={.contexts[?(@.name==\"$context\")].context.namespace}")" 
    echo " using namespace %{$fg_bold[yellow]%}${ns}%{$reset_color%} in context %{$fg_bold[magenta]%}${context}%{$reset_color%}"
  fi
}

export PROMPT=$'$(user_and_host_name):$(directory_name) $(git_status) $(the_time)\n%# '
