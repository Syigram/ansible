user=sygram

# update & upgrade
sudo apt-get update
sudo apt-get upgrade

# Install essentials
sudo apt-get install curl wget build-essential nginx cmake stow git xclip \
 python3-dev zlib1g-dev

# Day to day work
sudo apt-get install zsh zsh-doc nvim

# install Hyper.js terminal -- needs verification
cd ~/Downloads
curl -sL --proto-redir -all,https https://releases.hyper.is/download/deb | sudo dpkg -i

# verify that Menlo font is default in ~/.hyper.js
nvim ~/.hyper.js

# make repositories dir
mkdir -p ~/repos
mkdir -p ~/.zsh

# import dotfiles
git clone git@github.com:Syigram/dotfiles.git ~/dotfiles
cd ~/dotfiles
make dotfiles && cd ~

# install zsh's zplug plugin manager
mkdir -p ~/.zsh/zplug/ && cd ~/.zsh/zplug/
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh


# install tmux's tpm plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# install zsh Pure theme
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"

# install asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.5

# or...
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
cd ~/.asdf
git checkout "$(git describe --abbrev=0 --tags)"


# install asdf nodejs
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
asdf plugin-add nodejs 13.1.0
asdf global nodejs 13.1.0

# install asdf python
asdf plugin-add python
asdf install python 3.7.4
asdf global python 3.7.4

# change shell
sudo chsh -s /bin/zsh sygram

# configure YouCompleteMe
cd ~/.vim/plugged/YouCompleteMe
python3 ./install.py --clang-completer --ts-completer
