# dotfiles

This repository consists of configuration for any tools I use within my [Arch Linux][arch] and [neovim][] development environment. I use a *lot* of tools which culminate in a sort of Unix IDE, I use [stow][] to link all of the required configuration into my home directory.

## Installation

> This is what I use when setting up a new machine after installing [Arch][]. Don't just run this on a whim, this is essentially my custom built desktop environment, it's perfect for me but <del>could</del> *will* ruin your set up. Feel free to take what you want from here, but be careful about installing my entire set up over yours by mistake. Maybe try it in a VM as an experiment.

Firstly, clone this repository down to `~/dotfiles`, a few things assume it's kept there, sorry.

Presuming you're using Arch Linux, you can just run `make`. This will install everything listed in `packages.txt` (including [yaourt][]), link all of the configuration into your home directory then switch the default shell to [fish][].

```bash
# Regular Linux environment.

make

# Awesome Linux environment.
```

To perform a system wide update you can execute `yolo` from within a [fish][] shell. This includes system, npm and neovim packages as well as system maintenance. I run this every day, nothing has broken yet.

## Author

[Oliver Caldwell][site] / [@OliverCaldwell][twitter]

## Unlicenced

Find the full [unlicense][] in the `UNLICENSE` file, but here's a snippet.

>This is free and unencumbered software released into the public domain.
>
>Anyone is free to copy, modify, publish, use, compile, sell, or distribute this software, either in source code form or as a compiled binary, for any purpose, commercial or non-commercial, and by any means.

Do what you want. Learn as much as you can. Unlicense more software.

[unlicense]: http://unlicense.org/
[site]: http://oli.me.uk/
[twitter]: https://twitter.com/OliverCaldwell
[arch]: https://www.archlinux.org/
[stow]: http://www.gnu.org/software/stow/
[yaourt]: https://aur.archlinux.org/packages/yaourt/
[aur]: https://aur.archlinux.org/
[compton]: https://wiki.archlinux.org/index.php/Compton
[fish]: http://fishshell.com/
[antergos]: https://antergos.com/
[neovim]: https://neovim.io/
[emacs]: https://www.gnu.org/software/emacs/
