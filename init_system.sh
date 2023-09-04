#! /bin/bash

echo " _   _      _ _       "
echo "| | | | ___| | | ___  "
echo "| |_| |/ _ \ | |/ _ \ "
echo "|  _  |  __/ | | (_) |"
echo "|_| |_|\___|_|_|\___/ "


echo "Welcome! Let's start setting up your system."

cd ~ && sudo apt update && sudo apt upgrade

sudo apt install curl neofetch wget vim xclip -y

echo 'Installing Qt'
sudo apt install build-essential -y
sudo apt install -y qtcreator qtbase5-dev qt5-qmake cmake

echo 'Git'
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt-get update && sudo apt-get install git -y

echo "Installing python"
sudo apt install python3 python3-pip -y
pi3 install pandas seaborn xgboost keras 
sudo apt install jupyter-notebook -y

echo 'Installing ZSH'
sudo apt-get install zsh -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

sudo apt install tmux -y 
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo 'Installing VSCode'
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get install apt-transport-https -y
sudo apt-get update && sudo apt-get install code -y

echo 'Installing Code Settings Sync'
code --install-extension Shan.code-settings-sync
sudo apt-get install gnome-keyring -y
cls

echo 'Installing Docker'
sudo apt-get purge docker docker-engine docker.io
sudo apt-get install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
docker --version

sudo groupadd docker
sudo usermod -aG docker $USER
sudo chmod 777 /var/run/docker.sock

echo 'Installing docker-compose'
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

echo 'Installing VLC'
sudo apt-get install vlc -y
sudo apt-get install vlc-plugin-access-extra libbluray-bdj libdvdcss2 -y

echo 'Cloning your dotfiles'
DOTFILES_PATH=/tmp/dotfiles
git clone https://github.com/namig41/dotfiles.git $DOTFILES_PATH

cp -f $DOTFILES_PATH/vim/.vim.min $HOME/.vimrc

cp -f $DOTFILES_PATH/tmux/.tmux.conf $HOME

cp -f $DOTFILES_PATH/git/.gitconfig $HOME
cp -f $DOTFILES_PATH/git/.gitignore $HOME


cp -f $DOTFILES_PATH/arrow/arrow.zsh-theme $HOME/.oh-my-zsh/themes/
cp -f $DOTFILES_PATH/zsh/.zshrc $HOME

chsh -s $(which zsh) &

echo "   _    _ _            _                              _             _"
echo "  / \  | | |  ___  ___| |_ _   _ _ __      ___ _ __  (_) ___  _   _| |"
echo " / _ \ | | | / __|/ _ \ __| | | | '_ \    / _ \ '_ \ | |/ _ \| | | | |"
echo "/ ___ \| | | \__ \  __/ |_| |_| | |_) |  |  __/ | | || | (_) | |_| |_|"
echo "/_/   \_\_|_| |___/\___|\__|\__,_| .__( )  \___|_| |_|/ |\___/ \__, (_)"
echo "                                 |_|  |/            |__/       |___/"