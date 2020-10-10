#!/bin/zsh
kdbg=1
kil() {
    kcmd=killall
    lfile=/dev/null
    if [[ 1 -le $kdbg ]]; then
        lfile=/tmp/kil.out
        touch $lfile
        echo "*******************************************************"
        echo "$(date): kil $@"
        echo "\trunning -->|$kcmd $1|<--"
    fi
    $kcmd $1 1>$lfile 2>&1
    rc=$?
    if [[ 1 -le $kdbg ]]; then
        echo "\t... with status $rc"
        echo "\tnow running -->|$@ >/tmp/$1.log 2>&1 & disown|<--"
    fi
    $@ >/tmp/$1.log 2>&1 & disown
    rc=$?
    if [[ 1 -le $kdbg ]]; then
        echo "\t... with status $rc"
        echo "*******************************************************"
        echo
    fi
}

date > /tmp/profile.out

# [[ -e ~/.Xmodmap ]] && xmodmap ~/.Xmodmap





go="$HOME/go"
gosrc="$go/src"
gobin="$go/bin"
[[ ! -d $gosrc ]] && mkdir -p $gosrc
[[ ! -d $gobin ]] && mkdir -p $gobin
export PATH="$PATH:$gobin"
export GOPATH="$go"
export XDG_CONFIG_HOME="$HOME/.config"
which dotnet >/dev/null 2>&1 && PATH="$PATH:~/.dotnet/tools"
export VISUAL="nvim"
export EDITOR=$VISUAL
export PAGER="nvimpager"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/src
source /usr/bin/virtualenvwrapper.sh
