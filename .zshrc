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

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

[[ -z "${plugins[*]}" ]] && plugins=(
    zsh-autosuggestions
    zsh-history-substring-search
    z
    zsh-syntax-highlighting
    git
    docker
    docker-compose
    fzf
    extract
)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

# Aliases
source ~/.aliases

source ~/.zprofile

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

eval "$(atuin init zsh)"

# https://github.com/junegunn/fzf
# Fuzzy finder
source <(fzf --zsh)

source /usr/share/nvm/init-nvm.sh

# opencode
export PATH=/home/asdfractal/.opencode/bin:$PATH
