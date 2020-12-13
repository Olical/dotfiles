{ config, pkgs, ... }:

let
  dag = config.lib.dag;
  unstable = import (fetchTarball https://nixos.org/channels/nixos-unstable/nixexprs.tar.xz) {};
  thunar = pkgs.xfce.thunar.override { thunarPlugins = [pkgs.xfce.thunar-archive-plugin]; };
  python = pkgs.python3.withPackages (ps: with ps; [ pynvim ]);
  dwarf-fortress = unstable.dwarf-fortress-packages.dwarf-fortress-full.override {
    enableIntro = false;
    enableSound = false;
    enableSoundSense = false;
    enableStoneSense = false;
  };
in
{
  programs.home-manager.enable = true;
  home.stateVersion = "20.03";

  nixpkgs.config.allowUnfree = true;
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
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
    gnumake
    htop
    httpie
    joker
    killall
    lazygit
    leiningen
    maven
    netcat-gnu
    nodejs
    python
    ripgrep
    stow
    tree
    unstable.discord
    unstable.fzf
    unstable.janet
    unstable.luajit
    unstable.luarocks
    unstable.neovim # neovim-nightly
    unstable.racket
    unzip

    # Heavy GUI based things.
    # May want to comment these out in headless environments.
    baobab
    dwarf-fortress
    fira-code
    fira-code-symbols
    firefox
    gimp
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
    unstable.love_11
    unstable.obs-studio
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
