{ config, pkgs, ... }:

let
  dag = config.lib.dag;
  unstable = import (fetchTarball https://nixos.org/channels/nixos-unstable/nixexprs.tar.xz) {};
  thunar = pkgs.xfce.thunar.override { thunarPlugins = [pkgs.xfce.thunar-archive-plugin]; };
in
{
  programs.home-manager.enable = true;
  home.stateVersion = "20.09";
  home.username = "$USER";
  home.homeDirectory = "/home/$USER";

  nixpkgs.config.allowUnfree = true;
  fonts.fontconfig.enable = true;

  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
  ];

  home.packages = with pkgs; [
    asciinema
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
    neovim-nightly
    netcat-gnu
    nodejs
    python
    ripgrep
    stow
    tree
    unstable.clojure
    unstable.docker-compose
    unstable.fzf
    unstable.luajit
    unstable.luarocks
    unzip
    xmlformat

    # Heavy GUI based things.
    # May want to comment these out in headless environments.
    baobab
    bitwarden
    bitwarden-cli
    ffmpeg
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
    unstable.obs-studio
    vlc
    xclip
    xfce.xfce4-screenshooter
    xss-lock
  ];

  programs.direnv.enable = true;
  programs.direnv.enableNixDirenvIntegration = true;

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
