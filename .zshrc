source ~/.zprofile
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ZSH
export ZSH="${HOME}/.oh-my-zsh"
export ZSH_CUSTOM_PLUGIN="$ZSH/custom/plugins"

ZSH_THEME="powerlevel10k/powerlevel10k"
HIST_STAMPS="yyyy-mm-dd"

# WSL/Linux
if [ $OSTYPE = "linux-gnu" ]; then
	plugins=(
    zsh-autosuggestions
    zsh-history-substring-search
    z
    zsh-syntax-highlighting
    git
    docker
    docker-compose
  )
fi

# Exports
export GPG_TTY=$TTY
export DOTFILES="$HOME/projects/dotfiles"
export FLYCTL_INSTALL="$HOME/.fly"
export GOPATH="$HOME/projects/go"
# export BROWSER=wslview
export XDG_CONFIG_HOME="$HOME/.config/"
export XDG_CACHE_HOME="$HOME/.cache/"
export XDG_DATA_HOME="$HOME/.local/share/"
export XDG_STATE_HOME="$HOME/.local/state/"

# Path
export PATH="$HOME/.local/bin":"/usr/local/go/bin":"$HOME/projects/go/bin":"$FLYCTL_INSTALL/bin":$PATH
fpath=($fpath "$HOME/.zfunctions")

autoload -Uz compinit && compinit
autoload -Uz mkd py rfv

source $ZSH/oh-my-zsh.sh

# Aliases
source ~/.aliases

if [ -f ~/.work-aliases ]; then
	source ~/.work-aliases
fi

# zsh-autosuggestions
source $ZSH_CUSTOM_PLUGIN/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
bindkey '^ ' autosuggest-accept

# zsh-history-substring-search
source $ZSH_CUSTOM_PLUGIN/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH_CUSTOM_PLUGIN/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up # Up key
bindkey '^[[B' history-substring-search-down # Down key
# HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=1' # not working
# HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='fg=1' # not working

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
(( ! ${+functions[p10k]} )) || p10k finalize

bindkey '^H' backward-kill-word

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(atuin init zsh)"

# https://github.com/junegunn/fzf
# Fuzzy finder
source <(fzf --zsh)

if [ -e /home/asdfractal/.nix-profile/etc/profile.d/nix.sh ]; then . /home/asdfractal/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
eval
_direnv_hook() {
  trap -- '' SIGINT
  eval "$("/home/linuxbrew/.linuxbrew/bin/direnv" export zsh)"
  trap - SIGINT
}
typeset -ag precmd_functions
if (( ! ${precmd_functions[(I)_direnv_hook]} )); then
  precmd_functions=(_direnv_hook $precmd_functions)
fi
typeset -ag chpwd_functions
if (( ! ${chpwd_functions[(I)_direnv_hook]} )); then
  chpwd_functions=(_direnv_hook $chpwd_functions)
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
