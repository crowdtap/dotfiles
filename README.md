# Crowdtap dotfile config

## Why a common dotfile config?

* To be on the same page
* Unleash TMUX and VIM productivity power

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
4. run `git submodule init`
5. run `git submodule update`
6. run `make install`

## TMUX config

iTerm Users: You need to set `Option / Alt` keys as a meta key in your terminal application.

- iTerm:
    Preferences > Profiles > Default > Keys > Left option key acts as `+ Esc`
    Preferences > Profiles > Default > Keys > Right option key acts as `+ Esc`

Key Bindings
-------------

The following key bindings do not require you to send the prefix keystroke:

| Command                       | Result                              |
| -------------                 | -------------                       |
| **Initiation**                |                                     |
| "tmux"                        | Starts tmux                         |
| "tmux attach"                 | Re-attach to last open session      |
| "tmux attach -t session_name" | Attach to specific session          |
| **Termination**               |                                     |
| "exit"                        | Exits tmux                          |
| Alt + d                       | Detach                              |
| **New Pane**                  |                                     |
| Alt + -                       | Split vertically                    |
| Alt + pipe                    | Split horizontally                  |
| **Pane Movement**             |                                     |
| Alt + h                       | Go to the left pane                 |
| Alt + j                       | Go to the bottom pane               |
| Alt + k                       | Go to the top pane                  |
| Alt + l                       | Go to the right pane                |
| **Pane Resizing**             |                                     |
| Alt + Arrow                   | Resize pane                         |
| **Copy mode**                 |                                     |
| Alt + PageUp                  | Copy mode and page up               |
| Alt + u                       | Copy mode                           |
| Alt + Space                   | Select text                         |
| Alt + Return                  | Copy text                           |
| Alt + i                       | Paste                               |
| q                             | Quit copy mode                      |
| **Sessions**                  |                                     |
| Alt + c                       | New session                         |
| Alt + n                       | Next session                        |
| Alt + p                       | Previous session                    |
| Alt + 8                       | Choose a session to attach          |
| Alt + 9                       | Cycle left through sessions         |
| Alt + 0                       | Cycle right through sessions        |
| "tmux ls"                     | List tmux sessions                  |
| **Prefix**                    |                                     |
| Alt + e                       | Prefix (you probably won't need it) |

## VIM config

### Plugins

* [Molokai](https://github.com/nviennot/molokai)      - This color scheme makes it pretty and gives you kisses { :lipstick: => :kiss: }
* [NERDTree](https://github.com/scrooloose/nerdtree)  - Filesystem explorer - use `^g` to toggle it
* [Rails.vim](https://github.com/tpope/vim-rails)     - Navigate Rails project easily - `:help rails-navigation`
* [Fugitive](https://github.com/tpope/vim-fugitive)   - Deep git integration :octocat:
* [Tabular](https://github.com/godlygeek/tabular.git) - Alignment plugin (e.g. =>, |, :, ...)
* [NerdCommenter](https://github.com/scrooloose/nerdcommenter.git) - Comment efficiently single or multiple lines
* [QuickFixSigns](https://github.com/tomtom/quickfixsigns_vim.git) - Is responsible for these usefull +/- signs on the left side (live diff with git index)
* [Syntastic](https://github.com/scrooloose/syntastic.git) - Syntax checker, yells when you write mistakes :horse:
* [Endwise](https://github.com/tpope/vim-endwise.git) - Adds necessary end to functions and statements in ruby
* [Vim-ruby](https://github.com/vim-ruby/vim-ruby.git) - syntax highlighting for ruby files
* [Vim-coffee-script](https://github.com/kchmck/vim-coffee-script.git) - syntax highlighting for coffee script files
* [MiniBufExplorer](https://github.com/fholgado/minibufexpl.vim.git) - interactive buffer list on demand bound on `<leader>l` (also binds ^h,^j,^k,^l to move around windows)
* [Scss-syntax](https://github.com/cakebaker/scss-syntax.vim) - Adds SASS syntax highlighting
* [Less-css](https://github.com/groenewege/vim-less.git) - colors for LESS CSS files
* [Supertab](https://github.com/tsaleh/vim-supertab.git) - Tab completion
* [vim-cucumber-align-pipes](https://github.com/quentindecock/vim-cucumber-align-pipes.git) - Aligns pipes while you are actually typing them in cucumber features
* [screen plugin on Github](https://github.com/ervandew/screen) - [screen plugin on vim website](http://www.vim.org/scripts/script.php?script_id=2711) - Screen/Tmux integration
* [ctrl+p](https://github.com/kien/ctrlp.vim) - Fuzzy finder

### plugins - under the hood

* [Vundle](https://github.com/gmarik/vundle) - VIM plugin management

## Customization

Please put your custom setting in a `.custom.vim` file at the root of the dotfile directory

## Cheat sheet

### ctrl + p

* Press `<F6>` to purge the cache for the current directory to get new files, remove deleted files and apply new ignore options.
* Press `<c-f>` and `<c-b>` to cycle between modes.
* Press `<c-d>` to switch to filename only search instead of full path.
* Press `<c-r>` to switch to regexp mode.
* Use `<c-n>`, `<c-p>` to select the next/previous string in the prompt's history.
* Use `<c-y>` to create a new file and its parent directories.
* Use `<c-z>` to mark/unmark multiple files and `<c-o>` to open them.

If you need more information, please use `:help ctrlp` within vim

### Fugitive

These are really good videos showcasing Fugitive functionalities

* [#1 - A complement to command line git](http://vimcasts.org/episodes/fugitive-vim---a-complement-to-command-line-git/)
* [#2 - Fugitive vim working with the git index](http://vimcasts.org/episodes/fugitive-vim-working-with-the-git-index/)
* [#3 - Resolving merge conflicts with vimdiff](http://vimcasts.org/episodes/fugitive-vim-resolving-merge-conflicts-with-vimdiff/)
* [#4 - Browsing the git object database](http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/)
* [#5 - The history of a git repository](http://vimcasts.org/episodes/fugitive-vim-exploring-the-history-of-a-git-repository/)

## Credits

I would like to thank these guys, this config was largely inspired by their work:

- [Joshua Clayton](https://github.com/joshuaclayton/dotfiles)
- [Nicolas Viennot](https://github.com/nviennot/vim-config)
