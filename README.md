# dotfiles [![Join the chat at https://gitter.im/Wolfy87/dotfiles](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/Wolfy87/dotfiles?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

This repository consists of configuration for any tools I use within my [Arch Linux][arch] and [Vim][] development environment. I use my terminal as my IDE, so there's a lot of tools I depend on. I link all of this configuration into my home directory using [stow][].

## Installation

Firstly, clone this repository down to `~/dotfiles`, a few things assume it's kept there, sorry.

> This is what I use when setting up a new machine after installing [Antergos][] (a friendly and quick way to get [Arch][] running). Don't just run this on a whim, this is essentially my custom built desktop environment, it's perfect for me but could ruin your set up. Feel free to take what you want from here, but be careful about installing my entire set up over yours by mistake. Maybe try it in a VM?

Presuming you're using Arch Linux, you can just run `make`. This will install everything listed in `packages.txt` (including [yaourt][] and [infinality][]!), link all of the configuration into your home directory then switch the default shell to [fish][].

```bash
# Pre-awesome Linux environment.

make

# Awesome Linux environment.
```

To perform a system wide update you can execute `update` from within a [fish][] shell. This includes system, npm and vim packages.

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
[infinality]: https://wiki.archlinux.org/index.php/Infinality
[compton]: https://wiki.archlinux.org/index.php/Compton
[fish]: http://fishshell.com/
[antergos]: https://antergos.com/
[vim]: http://www.vim.org/
