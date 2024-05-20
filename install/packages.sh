apt update
apt upgrade -y

packages=(
  fzf
  ripgrep
  zsh
  etckeeper
  tmux
  python3-pip
  awscli
  postgresql
  postgresql-client
  restic
  unzip
  nodejs
  npm
)

echo ">> Installing ${packages[@]}"
apt install -y "${packages[@]}"

# nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
git clone https://github.com/adrian5/oceanic-next-vim.git ~/.local/share/nvim/site/pack/plugins/start/oceanic-next-vim