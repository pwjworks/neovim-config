cd ~

if [ ! -d "/etc/apt/sources.list.bak" ] && [ -d "/etc/apt/sources.list" ];then
  sudo mv /etc/apt/sources.list /etc/apt/sources.list.bak
fi

if [ -d "/etc/apt/sources.list" ];then
  sudo rm "/etc/apt/sources.list"
fi

sudo cp ~/.config/nvim/util/sources.list /etc/apt/sources.list

sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    git \
    wget \
    fd-find \
    ripgrep \
    libfuse2

    
# neovim
wget https://github.com/neovim/neovim/releases/download/v0.9.0/nvim.appimage
chmod +x ./nvim.appimage
sudo mv ./nvim.appimage /usr/bin/nvim

# zsh
sudo apt install -y zsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
cp ~/.config/nvim/util/.zshrc ~/.zshrc
cp ~/.config/nvim/util/.p10k.zsh ~/.p10k.zsh


zsh ~/.config/nvim/util/toolchains.sh
