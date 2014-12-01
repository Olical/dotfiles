# dotfiles

These are my tools that I use heavily every day, I implore you to steal anything that isn't nailed down (so, everything) and to use it to your own advantage. If you want to get in touch about anything in here, please do so through GitHub (@Wolfy87) or [@OliverCaldwell][]. Just to show how much I want to you take things from here wholesale, I've added [the unlicence][].

I have two scripts, `install.sh` and `update.sh`, which perform an initial setup and update things like my Vim plugins respectively. For the install to work you will need at least Vim and git installed. After that you may install these dependencies.

 * tmux
 * git-smart
 * ag
 * autojump
 * JSHint
 * fzf
 * cmake for *YouCompleteMe* compilation
 * node for `npm install` in *tern_for_vim*

Now everything should be installed and running, just execute `update.sh` if you want to synchronise the Vim plugins.

## Reverting Vim plugin updates

Before the Vim plugins are updated a script is generated to revert the changes. So if anything goes wrong, execute `dotfiles/vim/revert.sh` to roll back to before you updated. This functionality is only possible because [vim-plug][] is awesome.

## Getting started

Clone to `~/dotfiles`. Make sure you have the dependencies listed above (especially Vim and git!) then enter the newly cloned repository and execute `./install.sh`. That's it.

## Layout

Every directory contains configuration for a different tool. They each hold an `install.sh` file which links files into `~/...` and an optional `update.sh` file which can fetch updates for dependencies, for example. The entry point for each module is called `boostrap.*` where `*` could be `vim`, `tmux.conf` or `gitconfig` for example.

Within Vim, plugins are added to `vim/plugins.vim` and the configuration for each plugin is added to `vim/modules/plugins/{NAME}.vim`. So if you wanted to configure `tmux.vim`, you'd add your configuration to `vim/modules/plugins/timux.vim.vim` (yes, with the double `.vim`). Any other configuration goes into the various `vim/modules/*.vim` files, if one doesn't fit the bill then another one may be created. All of these files are loaded automatically.

## Vim key bindings

Execute `\\` to run `~/.vim/mappings.sh` which shows all current leader bindings. This acts as documentation for my mappings.

[@OliverCaldwell]: https://twitter.com/OliverCaldwell
[the unlicence]: http://unlicense.org/
[vim-plug]: https://github.com/junegunn/vim-plug
