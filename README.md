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

## Getting started

Clone to `~/dotfiles`. Make sure you have the dependencies listed above (especially Vim and git!) then enter the newly cloned repository and execute `./install.sh`. That's it.

## Layout

Every directory contains configuration for a different tool. They each hold an `install.sh` file which links files into `~/...` and an optional `update.sh` file which can fetch updates for dependencies, for example. The entry point for each module is called `boostrap.*` where `*` could be `vim`, `tmux.conf` or `gitconfig` for example.

Within Vim, bundles are added to `vim/bundles.vim` and the configuration for each bundle is added to `vim/modules/bundles/{NAME}.vim`. So if you wanted to configure `tmux.vim`, you'd add your configuration to `vim/modules/bundles/timux.vim.vim` (yes, with the double `.vim`). Any other configuration goes into the various `vim/modules/*.vim` files, if one doesn't fit the bill then another one may be created. All of these files are loaded automatically.

## Vim key bindings

All of the combinations below should be preceded by the leader key, every other binding is default to Vim.

Leader: `\`
Local leader: `|`

 * `bd` - Delete hidden buffers
 * `z` - Correct spelling to the first suggestion
 * `ft` - Trim the trailing whitespace of the file
 * `wf` - Make the window fullscreen by splitting it into a new tab

 * `/d` - Clear search
 * `/c` - Count search results

 * `gl` - Pull from the left hand diff
 * `gr` - Pull from the right hand diff
 * `gs` - Fugitive status
 * `gw` - Fugitive write
 * `gc` - Fugitive commit
 * `gb` - Fugitive blame
 * `gd` - Fugitive diff
 * `gj` - Fugitive pull
 * `gk` - Fugitive push
 * `gf` - Fugitive fetch

 * `sw` - Write the session file
 * `sr` - Read the session file`

 * `tn` - Toggle relative numbers (swaps to normal numbers in insert mode)
 * `tu` - Toggle undo tree
 * `ti` - Toggle indent guides

 * `uf` - Unite recursive files
 * `ul` - Unite files local to this directory
 * `ur` - Unite MRU
 * `uo` - Unite outline
 * `ug` - Unite grep (will use Ag if it can)
 * `uy` - Unite yank history
 * `ub` - Unite buffers

[@OliverCaldwell]: https://twitter.com/OliverCaldwell
[the unlicence]: http://unlicense.org/
