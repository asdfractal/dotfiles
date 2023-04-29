apt update
apt upgrade -y

packages=(
  fzf
  ripgrep
  zsh
  etckeeper
  git
  nvm
  neovim
  nano
  tmux
  docker
  docker-compose
)

apt install -y "${packages[@]}"
