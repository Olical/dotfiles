# dotfiles

This is the configuration for the tools that I use every day, I implore you to steal anything that isn't nailed down (so, everything) and to use it to your own advantage. If you want to get in touch about anything in here, please do so through GitHub ([Wolfy87][]) or [@OliverCaldwell][] on twitter. I've included [the unlicence][] with this repository to assure you that everything here is in the public domain, as is all of my future open source work.

My configuration can be installed via symlinks with [stow][] (`stow-all.sh` will link everything). Some of my configuration attempts to load `*_local` files to override my global settings. You'll also have to fetch [oh-my-zsh][] for zsh.

Package names (that are correct for Arch Linux at least) can be found in `packages.txt`. A lot of the packages can only be found on the AUR, so you'll want to install these with something like [yaourt][]. Install everything with `yaourt --needed -S $(cat packages)`. You'll need the wiki for the [inifinality font patches][infinality] installation.

[Wolfy87]: https://github.com/Wolfy87
[@OliverCaldwell]: https://twitter.com/OliverCaldwell
[the unlicence]: http://unlicense.org/
[stow]: http://www.gnu.org/software/stow/
[oh-my-zsh]: http://ohmyz.sh/
[yaourt]: https://aur.archlinux.org/packages/yaourt/
[infinality]: https://wiki.archlinux.org/index.php/Infinality
