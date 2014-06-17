#!/bin/bash
# Installs our dotfiles
#

declare -a dotfiles=(ackrc tmux.conf vim vimrc gvimrc gemrc irbrc irbrc.d jshintrc rdebugrc rvmrc zprezto zlogin zlogout zpreztorc zprofile zshenv zshrc zsh-themes gitconfig-ct editrc)

if [ ! -d 'zprezto' ]; then
  echo "Installing zprezto..."
  git clone -q --recursive https://github.com/sorin-ionescu/prezto.git zprezto
else
  echo "Updating zprezto..."
  cd zprezto
  git pull -q origin master && git submodule update --init --recursive -q
  cd - > /dev/null
fi

if [ ! -d 'vim/bundle/vundle' ]; then
  echo "Installing VIM plugins..."
  # pull the repos from the vimrc file
  plugins=( `grep "Bundle" vimrc | sed -E "s/Bundle '(.+)'/\1/g"` )
  for plugin in "${plugins[@]}"
  do
    echo "  $plugin"
    # dest is the second half of the plugin name
    dest=`sed -E "s/.+\/(.+)/\1/g" <<< $plugin`
    git clone -q https://github.com/$plugin vim/bundle/$dest
  done
else
  echo "Updating VIM plugins..."
  plugins=( `find vim/bundle -maxdepth 1 | tail -n +2` )
  for plugin in "${plugins[@]}"
  do
    dest=`sed -E "s/vim\/bundle\/(.+)/\1/g" <<< $plugin`
    echo "  $dest"
    cd $plugin && git pull -q origin master
    cd - > /dev/null
  done
fi

echo "OSX Customizations..."
bash osx

touch ~/.custom.tmux

echo "Creating Symlinks..."
cwd=`pwd`
for dotfile in "${dotfiles[@]}"
do
  if [ ! -h "$HOME/.$dotfile" ]; then
    echo "  $dotfile"
    ln -sf $cwd/$dotfile $HOME/.$dotfile
  fi
done
echo "Done"
