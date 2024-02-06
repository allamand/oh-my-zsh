# Autocompletion for helm.
#
# Copy from kubectl : https://github.com/pstadler

if [ $commands[helm] ]; then
    #source <(helm completion zsh)
    source <(helm completion zsh | sed -E 's/\["(.+)"\]/\[\1\]/g')
    #source ../../custom/helm_completion.zsh
fi

# If the completion file does not exist, generate it and then source it
# Otherwise, source it and regenerate in the background
if [[ ! -f "$ZSH_CACHE_DIR/completions/_helm" ]]; then
  helm completion zsh | tee "$ZSH_CACHE_DIR/completions/_helm" >/dev/null
  source "$ZSH_CACHE_DIR/completions/_helm"
else
  source "$ZSH_CACHE_DIR/completions/_helm"
  helm completion zsh | tee "$ZSH_CACHE_DIR/completions/_helm" >/dev/null &|
fi

alias h='helm'
alias hin='helm install'
alias hse='helm search'
alias hup='helm upgrade'
