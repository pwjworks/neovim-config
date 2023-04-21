cd ~
if [ ! -d "/etc/apt/sources.list.bak"] && [ -d "/etc/apt/sources.list" ];then
  sudo mv /etc/apt/sources.list /etc/apt/sources.list.bak
fi

if [ -d "/etc/apt/sources.list" ];then
  sudo rm "/etc/apt/sources.list"
fi

sudo cp ./sources.list /etc/apt/sources.list

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
sudo mv ./nvim.appimage /usr/bin/nvim

# zsh
sudo apt install -y zsh
chsh -s ${which zsh}
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
cp ./.zshrc ~/.zshrc

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


# cmake & xmake
wget https://github.com/Kitware/CMake/releases/download/v3.26.3/cmake-3.26.3-linux-x86_64.sh
sudo cd ~ | zsh ./cmake-3.26.3-linux-x86_64.sh
cd ~ | wget https://xmake.io/shget.text -O - | bash

# nodejs
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
source ~/.zshrc

# lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
