# .vim

This is my personal Vim setup. It uses a customised colour scheme, key bindings and bundle configuration. I use [Vundle](https://github.com/gmarik/vundle) to manage all of my bundles.

You can sync all of the bundles by executing `./sync-bundles.sh`. This will remove the old, update the current and install any new bundles. It will also download Vundle if you haven't cloned it into `bundle/vundle` already.

I also use [YouCompleteMe](https://github.com/Valloric/YouCompleteMe) for improved auto-completion. Once the bundle is downloaded you will have to run `./compile-ycm.sh` to build it's binary counterpart.

## What you can use this repository for.

I actually don't recommend downloading and using this as is. A Vim configuration is pretty personal and you should build your own with your keys mapped exactly how you want. You should probably start your own version of this repository in the same style and add the bundles, colour schemes and settings *you* want.

It's a great learning experience and by far the best way to learn how to use Vim. Trust me, it's worth it. I don't think I could go back to any other editor now. It is just too efficient.

I'd also highly recommend reading [Practical Vim](http://pragprog.com/book/dnvim/practical-vim) by [Drew Neil](http://drewneil.com/) if you are looking to broaden your knowledge. It was a pleasure to read and I've learnt a huge amount from it.

## Linking files.

If you do decide to use this for some reason, you will first need to run the things I listed in the first section. Then you can use `ln` to link my JSHint configuration file (if you want it) and then add the following line to your `~/.vimrc` to load it all.

```viml
source $HOME/.vim/config.vim
```

You can also add this line *before* the previous one if you want a lighter editor with no bundles. This is what I use on my Raspberry Pi.

```viml
let g:light_editor=1
```

## Local dot files.

There are a number of files you can add to your current directory to configure things on a per project basis. They are generally picked up by their respective bundles.

### .lvimrc

A local `.vimrc` file for project specific mappings and configuration.

```viml
set path+=src/**
set suffixesadd+=.js
nmap <leader>a :Ag! "<cword>\s*\(" src<CR>
```

### .srclist

A list of files or globs to inspected when building the tags index with either ctags or jsctags. The generated tags are stored in `.tags`. You can invoke the tag program with the `F5` key. If you are in a JavaScript file, it will use jsctags, if you are in any other file it will use the normal ctags program.

```viml
src/js/**/*.js
../someDependency/src/js/**/*.js
```

### .jshintrc (etc)

This is just a local JSHint configuration, it's not really specific to Vim, it's just the linter. Works well with Syntastic though.

*You may want to ignore the above files in your global `.gitignore`.*

## Enjoy.

I hope you find this helpful in your Vim adventures. As always: Star, fork and raise issues if you feel like it. Anything helps.

Thanks,

[Oliver Caldwell](http://oli.me.uk/)