#! /bin/bash

set -euo pipefail

# Install deps for initial setup and python.
sudo apt-get update && sudo apt-get install git curl vim make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev -y

# Install pyenv.
if [ -d ~/.pyenv ]; then
  rm -rf ~/.pyenv
fi

git clone https://github.com/pyenv/pyenv.git ~/.pyenv
git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv

# Vim config.
curl -SsL iostruhl.com/vimsetup/install.sh | bash

# Input tab completion config.
echo "set completion-ignore-case on" >> ~/.inputrc


echo '
# User defined aliases.
alias l="ls -lGgh"
alias la="ls -lGgah"

# Pyenv
PYENV_ROOT="$HOME/.pyenv"
PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

parse_git_branch() {
  git branch 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/ (\1)/"
}
export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[31m\]\$(parse_git_branch)\[\033[00m\] "
' >> ~/.bashrc

# Git config, storing revocable creds.
git config --global user.name "Isaac Struhl"
git config --global user.email "isaac@distributedspectrum.com"
git config --global credential.helper store

source ~/.bashrc

