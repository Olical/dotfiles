{ config, pkgs, ... }:

let
  dag = config.lib.dag;
  unstable = import (fetchTarball https://nixos.org/channels/nixos-unstable/nixexprs.tar.xz) {};
  thunar = pkgs.xfce.thunar.override { thunarPlugins = [pkgs.xfce.thunar-archive-plugin]; };
in
{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
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
    git
    htop
    httpie
    joker
    lazygit
    leiningen
    luajit
    netcat-gnu
    nodejs
    ripgrep
    stow
    tree
    unstable.fzf
    unstable.janet
    unstable.neovim

    # Heavy GUI based things.
    # May want to comment these out in headless environments.
    baobab
    discord
    fira-code
    fira-code-symbols
    firefox
    glibcLocales
    i3status
    kitty
    lastpass-cli
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    rofi
    spotify
    thunar
    unstable.obs-studio
    xclip
    xfce.xfce4-screenshooter
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
