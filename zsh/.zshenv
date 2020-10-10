#!/usr/bin/zsh
ZINITDIR=$HOME/.zinit
[[ -d $ZINITDIR ]] || (mkdir -p $ZINITDIR && \
    git clone https://github.com/zdharma/zinit.git ~/.zinit/bin)

ZPDIR=$HOME/.zprezto
if [[ ! -d $ZPDIR ]]; then
    zpurl=https://github.com/sorin-ionescu/prezto.git
    git clone --recursive $zpurl $ZPDIR
    setopt EXTENDED_GLOB
    for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
	    echo ".$(basename $rcfile)"
	    if [[ ".$(basename $rcfile)" == ".zshenv" ]]; then
		cat $rcfile >> $HOME/.zshenv
	    elif [[ ".$(basename $rcfile)" == ".zshrc" ]]; then
	        [[ -f $HOME/.zshrc ]] && mv $HOME/.zshrc $HOME/ztmp
                cp "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
		    [[ -f $HOME/ztmp ]] && cat $HOME/ztmp >> $HOME/.zshrc && rm -f $HOME/ztmp
	    elif [[ ".$(basename $rcfile)" == ".zpreztorc" ]]; then
		[[ -f $HOME/.zpreztorc ]] || cp $rcfile $HOME/.zpreztorc
	    else
                ln -is "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
	    fi
    done
fi

if [[ ! -d $ZPDIR/contrib ]]; then
    git clone --recurse-submodules https://github.com/belak/prezto-contrib $ZPDIR/contrib
fi

zinitsrc="source ~/.zinit/bin/zinit.zsh"
grep -q $zinitsrc $HOME/.zshrc || \
    sed -i "2i$zinitsrc" $HOME/.zshrc  
#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi
#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi
