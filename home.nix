{ config, pkgs, ... }:

let
  dag = config.lib.dag;
  unstable = import (fetchTarball https://nixos.org/channels/nixos-unstable/nixexprs.tar.xz) {};
  thunar = pkgs.xfce.thunar.override { thunarPlugins = [pkgs.xfce.thunar-archive-plugin]; };
  neovim = unstable.neovim.override { withNodeJs = true; };
in
{
  programs.home-manager.enable = true;
  home.stateVersion = "20.03";

  nixpkgs.config.allowUnfree = true;
  fonts.fontconfig.enable = true;

  home.packages = with unstable; [
    asciinema
    bat
    clojure
    cowsay
    curl
    direnv
    entr
    feh
    fish
    gcc
    git
    htop
    httpie
    joker
    lazygit
    leiningen
    maven
    neovim
    netcat-gnu
    nodejs
    ripgrep
    stow
    tree
    fzf
    janet
    luajit
    luarocks
    racket

    # Heavy GUI based things.
    # May want to comment these out in headless environments.
    baobab
    discord
    fira-code
    fira-code-symbols
    firefox
    glibcLocales
    i3lock
    i3status
    kitty
    lastpass-cli
    networkmanagerapplet
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    rofi
    spotify
    thunar
    dwarf-fortress
    obs-studio
    xclip
    xfce.xfce4-screenshooter
    xss-lock
  ];

  home.activation.stow = dag.entryAfter [ "writeBoundary" ] ''
    cd $HOME/.config/nixpkgs
    stow --target=$HOME stowed
  '';

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };
}
