{ config, pkgs, ... }:

# TODO node, rust, joker, clj-kondo
# TODO clipman or similar

let
  dag = config.lib.dag;
  unstable = import (fetchTarball https://nixos.org/channels/nixos-unstable/nixexprs.tar.xz) {};
  maple = import ./pkgs/maple.nix pkgs;
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
    cowsay
    curl
    fish
    fzf
    git
    htop
    lazygit
    maple
    unstable.neovim
    ripgrep
    stow
    tree
    xclip
    lastpass-cli
    asciinema

    unstable.janet
    clojure
    leiningen

    discord
    spotify
    firefox
    kitty
    xfce.xfce4-screenshooter

    rofi
    i3status

    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    fira-code
    fira-code-symbols
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
