This is my personal Vim setup. It uses my own colour scheme, key bindings and bundle configuration. I use [Vundle](https://github.com/gmarik/vundle) to manage all of my bundles, you need to fetch that as a submodule.

You can sync all of the bundles by executing `./sync-bundles.sh`. This will remove the old, update the current and install any new bundles.

I also use [YouCompleteMe](https://github.com/Valloric/YouCompleteMe) for improved auto-completion. Once the bundle is downloaded you will have to run `./compile-ycm.sh` to build it's binary counter part.

## What you can use this repository for.

I actually don't recommend downloading and using this as is. A Vim configuration is pretty personal and you should build your own with your keys mapped exactly how you want. You should probably start your own version of this repository in the same style and add the bundles, colour schemes and settings *you* want.

It's a great learning experience and by far the best way to learn how to use Vim. Trust me, it's worth it. I don't think I could go back to any other editor now. It is just too efficient.

## Linking files.

If you do decide to use this for some reason, you will first need to run the things I listed in the first section. Then you can use `ln` to link my JSHint configuration file (if you want it) and then add the following line to your `~/.vimrc` to load it all.

```viml
source $HOME/.vim/config.vim
```

You can also add this line *before* the previous one if you want a lighter editor with no bundles. This is what I use on my Raspberry Pi.

```viml
let g:light_editor=1
```

## Enjoy.

I hope you find this helpful in your Vim adventures. As always: Star, fork and raise issues if you feel like it. Anything helps.

Thanks,

[Oliver Caldwell](http://oli.me.uk/)