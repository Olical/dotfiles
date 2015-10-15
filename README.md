# dotfiles [![Join the chat at https://gitter.im/Wolfy87/dotfiles](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/Wolfy87/dotfiles?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

This repository consists of configuration for any tools I use within my Linux ([Arch][]) and Vim development environment. I use my terminal as my IDE, so there's a lot of tools I depend on. I link all of this configuration into my home directory using [stow][].

I'd highly recommend [yaourt][] to abstract away the [AUR][] as well as installing [infinality][] fonts, they look excellent.

## Tooling

You can install everything listed in my `packages.txt` with `yaourt -S --needed --noconfirm $(cat packages.txt)`. The `--noconfirm` is optional, but it makes the AUR stuff far quicker, there's a lot of questions otherwise.

You may have to install `termite` separately first since it asked me a question on install which stopped the process. It wanted to replace a conflicting package which I agreed to.

You can set fish as your shell with `chsh -s $(which fish)`.

## Author

[Oliver Caldwell][] / [@OliverCaldwell][]

## Unlicenced

Find the full [unlicense][] in the `UNLICENSE` file, but here's a snippet.

>This is free and unencumbered software released into the public domain.
>
>Anyone is free to copy, modify, publish, use, compile, sell, or distribute this software, either in source code form or as a compiled binary, for any purpose, commercial or non-commercial, and by any means.

Do what you want. Learn as much as you can. Unlicense more software.

[unlicense]: http://unlicense.org/
[Oliver Caldwell]: http://oli.me.uk/
[@OliverCaldwell]: https://twitter.com/OliverCaldwell
[Arch]: https://www.archlinux.org/
[stow]: http://www.gnu.org/software/stow/
[yaourt]: https://aur.archlinux.org/packages/yaourt/
[AUR]: https://aur.archlinux.org/
[infinality]: https://wiki.archlinux.org/index.php/Infinality
[compton]: https://wiki.archlinux.org/index.php/Compton
