# dotfiles

These are my tools that I use heavily every day, I implore you to steal anything that isn't nailed down (so, everything) and to use it to your own advantage. If you want to get in touch about anything in here, please do so through GitHub (@Wolfy87) or [@OliverCaldwell][]. Just to show how much I want to you take things from here wholesale, I've added [the unlicence][].

I have two scripts, `install.sh` and `update.sh`, which perform an initial setup and update things like my Vim bundles respectively. For the install to work you will need at least Vim and git installed. After that you may install these optional dependencies.

 * tmux
 * git-smart
 * ag
 * autojump
 * JSHint

Once the install is complete you'll want to configure a few of the Vim modules. They can be found within `vim/bundles`.

 * `install.sh` in `YouCompleteMe`
 * `npm install` in `tern_for_vim`
 * `make` in `vimproc`

Now everything should be installed and running, just execute `update.sh` if you want to synchronise the Vim bundles.

## Layout

Every directory contains configuration for a different tool. They each hold an `install.sh` file which links files into `~/...` and an optional `update.sh` file which can fetch updates for dependencies, for example. The entry point for each module is called `boostrap.*` where `*` could be `vim`, `tmux.conf` or `gitconfig` for example.

Within Vim, bundles are added to `vim/bundles.vim` and the configuration for each bundle is added to `vim/modules/bundles/{NAME}.vim`. So if you wanted to configure `tmux.vim`, you'd add your configuration to `vim/modules/bundles/timux.vim.vim` (yes, with the double `.vim`). Any other configuration goes into the various `vim/modules/*.vim` files, if one doesn't fit the bill then another one may be created. All of these files are loaded automatically.

[@OliverCaldwell]: https://twitter.com/OliverCaldwell
[the unlicence]: http://unlicense.org/
