#! /bin/bash

sudo apt-get update

# Install initial requirements.
sudo apt install git curl vim

# Vim setup, aliases, and other quality of life.
curl -SsL iostruhl.com/vimsetup/install.sh | bash
echo "set completion-ignore-case on" >> ~/.inputrc
echo >> ~/.profile
echo '# User defined aliases.' >> ~/.profile
echo 'alias l="ls -lGgh"' >> ~/.profile
echo 'alias la="ls -lGgah"' >> ~/.profile
echo 'alias mka="vim ~/.profile"' >> ~/.profile
echo 'alias src="source ~/.profile"' >> ~/.profile

# Install python build dependencies.
sudo apt-get install --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

# Install pyenv and pyenv-virtualenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

echo >> ~/.profile
echo 'PYENV_ROOT="$HOME/.pyenv"' >> ~/.profile
echo 'PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.profile
echo >> ~/.profile
echo 'eval "$(pyenv init -)"' >> ~/.profile

exec "$SHELL"

git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
echo >> ~/.profile
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.profile

exec "$SHELL"

