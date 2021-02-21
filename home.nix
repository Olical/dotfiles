{ config, pkgs, ... }:

let
  dag = config.lib.dag;
  unstable = import (fetchTarball https://nixos.org/channels/nixos-unstable/nixexprs.tar.xz) {};
  thunar = pkgs.xfce.thunar.override { thunarPlugins = [pkgs.xfce.thunar-archive-plugin]; };
  hy = unstable.python3.pkgs.buildPythonPackage rec {
    pname = "hy";
    version = "0.20.0";
    src = unstable.python3.pkgs.fetchPypi {
      inherit pname version;
      sha256 = "1b72863754fb57e2dd275a9775bf621cb50a565e76733a2e74e9954e7fbb060e";
    };
    doCheck = false;
    propagatedBuildInputs = with unstable.python3Packages; [
      astor colorama funcparserlib rply
    ];
  };
  python = unstable.python3.withPackages (ps: with ps; [ pynvim hy ]);
  dwarf-fortress = unstable.dwarf-fortress-packages.dwarf-fortress-full.override {
    enableIntro = false;
    enableSound = false;
    enableSoundSense = false;
    enableStoneSense = false;
  };
in
{
  programs.home-manager.enable = true;
  home.stateVersion = "20.09";
  home.username = "$USER";
  home.homeDirectory = "/home/$USER";

  nixpkgs.config.allowUnfree = true;
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    asciinema
    bat
    cowsay
    curl
    direnv
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
    leiningen
    maven
    mitscheme
    netcat-gnu
    nodejs
    python
    ripgrep
    stow
    tree
    unstable.clojure
    unstable.docker-compose
    unstable.fzf
    unstable.guile
    unstable.janet
    unstable.luajit
    unstable.luarocks
    unstable.neovim # neovim-nightly
    unstable.racket
    unzip
    xmlformat

    # Heavy GUI based things.
    # May want to comment these out in headless environments.
    baobab
    bitwarden bitwarden-cli
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
    pavucontrol
    rofi
    spotify
    steam
    thunar
    unstable.discord
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
