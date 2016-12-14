#!/bin/bash
# Installs our dotfiles
#

declare -a dotfiles=(ackrc editrc gemrc gitconfig-ct gvimrc irb irbrc.d jshintrc ops rdebugrc rubocop.yml rvmrc stylelintrc tmux tmux.conf vim vimrc zlogin zlogout zprezto zpreztorc zprofile zsh-themes zshenv zshrc)

if [ ! -d 'zprezto' ]; then
  echo "Installing zprezto..."
  git clone -q --depth 1 --recursive https://github.com/sorin-ionescu/prezto.git zprezto
else
  echo "Updating zprezto..."
  cd zprezto
  git fetch -q origin master && git reset -q --hard origin/master && git submodule update --init --recursive -q
  cd - > /dev/null
fi

if [ ! -d 'vim/bundle/Vundle.vim' ]; then
  echo "Installing VIM plugins..."
  # pull the repos from the vimrc file
  plugins=( `grep "Plugin" vimrc | sed -E "s/Plugin '(.+)'/\1/g"` )
  for plugin in "${plugins[@]}"
  do
    echo "  $plugin"
    # dest is the second half of the plugin name
    dest=`sed -E "s/.+\/(.+)/\1/g" <<< $plugin`
    git clone -q --depth 1 https://github.com/$plugin vim/bundle/$dest
  done
else
  echo "Updating VIM plugins..."
  plugins=( `find vim/bundle -maxdepth 1 | tail -n +2` )
  for plugin in "${plugins[@]}"
  do
    dest=`sed -E "s/vim\/bundle\/(.+)/\1/g" <<< $plugin`
    echo "  $dest"
    cd $plugin && git fetch -q origin master && git reset -q --hard origin/master
    cd - > /dev/null
  done
fi

if [ ! -d 'tmux/plugins/tpm' ]; then
  echo "Installing Tmux plugins..."
  # pull the repos from the tmux.conf file
  plugins=( `grep "@plugin" tmux.conf | sed -E "s/set -g @plugin '(.+)'/\1/g"` )
  for plugin in "${plugins[@]}"
  do
    echo "  $plugin"
    # dest is the second half of the plugin name
    dest=`sed -E "s/.+\/(.+)/\1/g" <<< $plugin`
    git clone -q --depth 1 https://github.com/$plugin tmux/plugins/$dest
  done
else
  echo "Updating tmux plugins..."
  plugins=( `find tmux/plugins -maxdepth 1 | tail -n +2` )
  for plugin in "${plugins[@]}"
  do
    dest=`sed -E "s/tmux\/plugins\/(.+)/\1/g" <<< $plugin`
    echo "  $dest"
    cd $plugin && git fetch -q origin master && git reset -q --hard origin/master
    cd - > /dev/null
  done
fi

if [ ! -d 'irb' ]; then
  echo "Installing irb-config..."
  git clone -q https://github.com/crowdtap/irb-config.git irb
  cd irb
  make install OVERWRITE=1 RUBY=rbenv
else
  echo "Updating irb-config..."
  cd irb
  git pull -q
  echo "--> Run 'make install' from ~/.irb to update irb-config gems <--"
fi
cd - > /dev/null

if [ ! -f $HOME/.osx-customized ]; then
  touch $HOME/.osx-customized
  echo "OSX Customizations..."
  bash osx
fi

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
