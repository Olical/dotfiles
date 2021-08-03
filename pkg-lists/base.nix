{ pkgs, unstable }:

let
  babashka = import ../pkgs/babashka.nix pkgs;
in
  with pkgs; [
    asciinema
    babashka
    bat
    cowsay
    curl
    entr
    feh
    fish
    gcc
    git
    git-secret
    gnumake
    htop
    httpie
    joker
    killall
    lazygit
    maven
    netcat-gnu
    nodejs
    pinentry-curses
    python
    ripgrep
    stow
    tree
    unstable.clojure
    unstable.clojure-lsp
    unstable.docker-compose
    unstable.fzf
    unstable.luajit
    unstable.luarocks
    unstable.neovim
    unzip
    xmlformat
  ]
