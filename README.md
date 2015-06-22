# dotfiles [![Join the chat at https://gitter.im/Wolfy87/dotfiles](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/Wolfy87/dotfiles?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

This repository consists of configuration for any tools I use within my Linux ([Arch][]) and Vim development environment. I use my terminal as my IDE, so there's a lot of tools I depend on. I link all of this configuration into my home directory using [stow][].

I'd highly recommend [yaourt][] to abstract away the [AUR][] as well as installing [infinality][] fonts, they look excellent.

## Tooling

Here's my current list of tooling and quick descriptions of their jobs. It doesn't include everything I depend on, but it's certainly the majority. `packages.txt` contains a more complete list of the packages I depend upon, such as [compton][], my window compositor.

 * `bin`            Simple scripts that are placed in my path.
 * `dunst`          Lightweight notifications.
 * `git`            Kind of obvious. Awesome version control.
 * `gtk`            Theme and font configuration for GTK applications.
 * `i3`             My tiling window manager of choice.
 * `leiningen`      Clojure build system.
 * `ranger`         Lightweight file manager with Vim bindings.
 * `tmux`           Terminal multiplexer, main part of my workflow.
 * `vim`            The best text editor. *Highly* customised.
 * `xfce4-terminal` A lightweight terminal from XFCE.
 * `termite`        Simple, modal and configurable terminal. Replacing my xfce4-terminal usage.
 * `zsh`            My shell of choice, depends upon oh-my-zsh.

You can install everything listed in my `packages.txt` with `yaourt -S --needed --no-confirm $(packages.txt)`. The `--no-confirm` is optional, but it makes the AUR stuff far quicker, there's a lot of questions otherwise.

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
