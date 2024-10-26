#!/bin/bash

wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
tar -xzvf nvim-linux64.tar.gz
mv nvim-linux64 /opt/
rm -rf nvim-linux64.tar.gz
echo 'export PATH="/opt/nvim-linux64/bin:$PATH"' >> ~/.bashrc

sudo update-alternatives --install /usr/bin/vim vim /opt/nvim-linux64/bin/nvim 10
sudo update-alternatives --set vim /opt/nvim-linux64/bin/nvim

rm -rf ~/.config/nvim
cp -rf .config/nvim ~/.config/nvim
