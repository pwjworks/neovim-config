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
    ripgrep
    
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

# docker
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

zsh ~/.config/nvim/util/toolchains.sh
