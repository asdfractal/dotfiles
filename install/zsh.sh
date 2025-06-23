# omz
echo $SUDO_USER
sudo -u $SUDO_USER sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install zsh plugins
sudo -u $SUDO_USER git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /home/$SUDO_USER/.oh-my-zsh/custom/themes/powerlevel10k
sudo -u $SUDO_USER git clone https://github.com/zsh-users/zsh-autosuggestions /home/$SUDO_USER/.oh-my-zsh/custom/plugins/zsh-autosuggestions
sudo -u $SUDO_USER git clone https://github.com/zsh-users/zsh-history-substring-search /home/$SUDO_USER/.oh-my-zsh/custom/plugins/zsh-history-substring-search
sudo -u $SUDO_USER git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /home/$SUDO_USER/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

sudo -u $SUDO_USER chsh -s $(which zsh)
