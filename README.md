# dotfiles

This is the configuration for the tools that I use every day, I implore you to steal anything that isn't nailed down (so, everything) and to use it to your own advantage. If you want to get in touch about anything in here, please do so through GitHub ([Wolfy87][]) or [@OliverCaldwell][] on twitter. I've included [the unlicence][] with this repository to assure you that everything here is in the public domain, as is all of my future open source work.

Most of my configuration is installed with [stow][] via symlinks. Some of my configuration attempts to load `*_local` files to override my global settings. You'll also have to fetch [oh-my-zsh][] for zsh.

## Getting started

Clone to `~/dotfiles`. Make sure you have the dependencies listed above (especially Vim and git!) then enter the newly cloned repository and execute `stow NAME` where `NAME` is one of the directories you wish to be linked. With Vim and Emacs you need to execute the `sync.sh` scripts in their respective directories to fetch the plugins.

## Layout

Every directory contains configuration for a different tool. Within Vim, plugins are added to `plugins.vim` and the configuration for each plugin is added to `modules/plugins/{NAME}.vim`. So if you wanted to configure `tmux.vim`, you'd add your configuration to `modules/plugins/timux.vim.vim` (yes, with the double `.vim`). Any other configuration goes into the various `modules/*.vim` files, if one doesn't fit the bill then another one may be created. All of these files are loaded automatically.

[Wolfy87]: https://github.com/Wolfy87
[@OliverCaldwell]: https://twitter.com/OliverCaldwell
[the unlicence]: http://unlicense.org/
[vim-plug]: https://github.com/junegunn/vim-plug
[stow]: http://www.gnu.org/software/stow/
[oh-my-zsh]: http://ohmyz.sh/
