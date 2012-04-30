# Crowdtap dotfile config, created from scratch

![Hamburger](http://www.passportmagazine.com/blog/uploads/DeathbyHamburger.jpg)

## What's inside?
* A solid VIM config
* A solid TMUX config
* Extra dotfiles (ackrc, irbrc, gemrc)

See below for further details

## Install
1. clone this repository
2. cd into the repository
3. specify the dotfiles you want to use in the `MANIFEST` file (by default everything is installed)
4. run `make install`

## Vim config

### Plugins

* [Molokai](https://github.com/nviennot/molokai)      - This color scheme makes it pretty and gives you kisses { :lipstick: => :kiss: }
* [NERDTree](https://github.com/scrooloose/nerdtree)  - Filesystem explorer - use `^g` to toggle it - it is not a :christmas_tree: but it helps
* [Rails.vim](https://github.com/tpope/vim-rails)     - Navigate Rails project easily
* [Fugitive](https://github.com/tpope/vim-fugitive)   - Deep git integration :octocat:
* [Tabular](https://github.com/godlygeek/tabular.git) - Alignment plugin (e.g. =>, |, :, ...)
* [NerdCommenter](https://github.com/scrooloose/nerdcommenter.git) - Comment efficiently single or multiple lines
* [QuickFixSigns](https://github.com/tomtom/quickfixsigns_vim.git) - Is responsible for these usefull +/- signs on the left side (live diff with git index)
* [Syntastic](https://github.com/scrooloose/syntastic.git) - Syntax checker, yells when you write mistakes :horse:
* [Endwise](https://github.com/tpope/vim-endwise.git) - Adds necessary end to functions and statements in ruby
* [Vim-ruby](https://github.com/vim-ruby/vim-ruby.git) - syntax highlighting for ruby files

### plugins - under the hood

* [Pathogen](https://github.com/tpope/vim-pathogen) - Runtime path management

## Credits

I would like to thank these guys, this config was largely inspired by there work:

- [Joshua Clayton](https://github.com/joshuaclayton/dotfiles)
- [Nicolas Viennot](https://github.com/nviennot/vim-config)
