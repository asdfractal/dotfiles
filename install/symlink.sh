rm -rf $HOME/.config/nvim
mkdir -p $HOME/.config/nvim
ln -snf $DOTFILES/nvim/* $HOME/.config/nvim

rm -rf $HOME/.local/bin
mkdir -p $HOME/.local/bin
ln -snf $DOTFILES/scripts/* $HOME/.local/bin

rm -rf $HOME/.zfunctions
mkdir -p $HOME/.zfunctions
ln -snf $DOTFILES/zfunctions/* $HOME/.zfunctions

ln -sf $DOTFILES/.p10k.zsh $HOME/.p10k.zsh
ln -sf $DOTFILES/.zshrc $HOME/.zshrc
ln -sf $DOTFILES/.zprofile $HOME/.zprofile
ln -sf $DOTFILES/.aliases $HOME/.aliases
ln -sf $DOTFILES/tmux/.tmux.conf $HOME/.tmux.conf
ln -sf $DOTFILES/tmux/.tmux-cht-languages $HOME/.tmux-cht-languages
ln -sf $DOTFILES/tmux/.tmux-cht-command $HOME/.tmux-cht-command
ln -snf $DOTFILES/.editorconfig $HOME/projects/.editorconfig
