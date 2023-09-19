#! /bin/bash

set -euxo pipefail

# Install deps for initial setup and python.
sudo apt-get update && sudo apt-get install git curl vim make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev -y

# Vim setup, aliases, and other quality of life.
curl -SsL iostruhl.com/vimsetup/install.sh | bash
echo "set completion-ignore-case on" >> ~/.inputrc
echo >> ~/.bashrc
echo '# User defined aliases.' >> ~/.bashrc
echo 'alias l="ls -lGgh"' >> ~/.bashrc
echo 'alias la="ls -lGgah"' >> ~/.bashrc
echo 'alias mka="vim ~/.bashrc"' >> ~/.bashrc
echo 'alias src="source ~/.bashrc"' >> ~/.bashrc

# Install pyenv and pyenv-virtualenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

echo >> ~/.bashrc
echo 'PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc

git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
echo >> ~/.bashrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc

source ~/.bashrc
