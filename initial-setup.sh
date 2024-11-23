#!/bin/bash

readonly PYTHON_VERSION="3.10"
readonly NODE_VERSION="23"

echo "npm is required to install python lsp - install nvm now? (y/n)"
read -n 1 is_nvm_installation

if [[ "$is_nvm_installation" == "y" ]]; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
  nvm install $NODE_VERSION
  npm install -g npm@latest
fi

echo "python is required to install python lsp - install pyenv now? (y/n)"
read -n 1 is_pyenv_installation

if [[ "$is_pyenv_installation" == "y" ]]; then
  curl https://pyenv.run | bash
  echo -e 'export PYENV_ROOT="$HOME/.pyenv"                                                                                                                                                               
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"                                                                                                                                
eval "$(pyenv init -)"                                                                                                                                                                         
                                                                                                                                                                                               
# Restart your shell for the changes to take effect.                                                                                                                                           

# Load pyenv-virtualenv automatically by adding
# the following to ~/.bashrc:

eval "$(pyenv virtualenv-init -)' >> ~/.bashrc

  sudo apt-get install build-essential zlib1g-dev libffi-dev libssl-dev libbz2-dev libreadline-dev libsqlite3-dev liblzma-dev libncurses-dev tk-dev
  pyenv install $PYTHON_VERSION
  pyenv global $PYTHON_VERSION
fi

wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
tar -xzvf nvim-linux64.tar.gz
mv nvim-linux64 /opt/
rm -rf nvim-linux64.tar.gz
echo 'export PATH="/opt/nvim-linux64/bin:$PATH"' >> ~/.bashrc

sudo update-alternatives --install /usr/bin/vim vim /opt/nvim-linux64/bin/nvim 10
sudo update-alternatives --set vim /opt/nvim-linux64/bin/nvim

rm -rf ~/.config/nvim
cp -rf .config/nvim ~/.config/nvim

curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz
sudo mv JetBrainsMono.tar.xz /usr/local/share/fonts/
cd /usr/local/share/fonts/
sudo tar -xf JetBrainsMono.tar.xz
sudo rm /usr/local/share/fonts/JetBrainsMono.tar.xz
fc-cache -fv

# Installing Packer package manager
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
