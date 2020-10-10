#
source ~/.zinit/bin/zinit.zsh
zmodload zsh/curses
zinit ice from'gh-r' as'program'
zinit light sei40kr/fast-alias-tips-bin
zinit light sei40kr/zsh-fast-alias-tips

zinit light-mode for \
    webyneter/docker-aliases \
    greymd/docker-zsh-completion \
    littleq0903/gcloud-zsh-completion \
    petervanderdoes/git-flow-completion
# zinit ice atload"init.sh"
zinit ice atload"init.sh" 
zinit load avivl/gcloud-project
zinit ice atload"zpcdreplay" atclone'./zplug.zsh'
zinit light g-plane/zsh-yarn-autocompletions

zinit load srijanshetty/zsh-pip-completion
zinit load  zdharma/zui
zinit wait lucid for zinit-zsh/zinit-console
zinit load softmoth/zsh-vim-mode
zinit load csurfer/tmuxrepl
zinit load torin-asakura/zsh-theia-dev-tools


# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi


setopt COMPLETE_ALIASES
zstyle ':completion::complete:*' gain-privileges 1
autoload -Uz compinit
compinit

# Customize to your needs...
[[ -f ~/.aliases ]] && source ~/.aliases

# pyenv
source <(pyenv init -)
source <(pyenv virtualenv-init -)
source /usr/share/zsh/site-functions/_pyenv
pyenv virtualenvwrapper_lazy

# extensions
source <(fasd --init auto)
source <(direnv hook zsh)
#source <(rbenv init -)
#source <(jenv init -)

# completion
source "/usr/share/fzf/completion.zsh"
source "/usr/share/fzf/key-bindings.zsh"
# source "${GOOGLE_CLOUD_SDK}/path.zsh.inc"
# source "${GOOGLE_CLOUD_SDK}/completion.zsh.inc"
#

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit


which pmy >/dev/null || go get -v -u github.com/relastle/pmy
[[ -d ~/.pmy ]] || \
    git clone https://github.com/relastle/pmy-config $HOME/.pmy
eval "$(pmy init)"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
