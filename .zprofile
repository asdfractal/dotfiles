VIM="nvim"
export GIT_EDITOR=$VIM
export GPG_TTY=$TTY
export GOPATH="$HOME/.local/go"
export XDG_CONFIG_HOME="$HOME/.config/"
export XDG_CACHE_HOME="$HOME/.cache/"
export XDG_DATA_HOME="$HOME/.local/share/"
export XDG_STATE_HOME="$HOME/.local/state/"

export HISTCONTROL=ignoreboth
export HISTIGNORE="&:[bf]g:c:clear:history:exit:q:pwd:* --help"
export LESS_TERMCAP_md="$(tput bold 2> /dev/null; tput setaf 2 2> /dev/null)"
export LESS_TERMCAP_me="$(tput sgr0 2> /dev/null)"C

bindkey -s ^f "tmux-sessioniser\n"

addToPathFront() {
    if [[ ! -z "$2" ]] || [[ "$PATH" != *"$1"* ]]; then
        export PATH=$1:$PATH
    fi
}

addToPathFront $HOME/.local/scripts
addToPathFront $HOME/.local/bin
addToPathFront $HOME/.local/go/bin
addToPathFront /usr/local/go/bin

fpath=($fpath "$HOME/.zfunctions")
autoload -Uz compinit && compinit
autoload -Uz mkd py rfv

if [ -f ~/.env ]; then
   source ~/.env
fi

if [ -z "$SSH_AUTH_SOCK" ]; then
   # Check for a currently running instance of the agent
   RUNNING_AGENT="`ps -ax | grep 'ssh-agent -s' | grep -v grep | wc -l | tr -d '[:space:]'`"
   if [ "$RUNNING_AGENT" = "0" ]; then
        # Launch a new instance of the agent
        ssh-agent -s &> $HOME/.ssh/ssh-agent
   fi
   eval `ssh-agent -s`
fi
