{ config, pkgs, ... }:

# TODO discord, spotify, pynvim, node, rust, lazygit, joker, clj-kondo

let
  dag = config.lib.dag;
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

  home.packages = with pkgs; [
    htop
    firefox
    kitty
    neovim
    git
    tree
    httpie
    curl
    fish
    cowsay
    fzf
    leiningen
    xclip
    ripgrep
    clojure

    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
  ];

  home.activation.linkAllTheThings = dag.entryAfter [ "writeBoundary" ] ''
    ln -sf $HOME/.config/nixpkgs/clojure $HOME/.clojure
    ln -sf $HOME/.config/nixpkgs/fish $HOME/.config/fish
    ln -sf $HOME/.config/nixpkgs/kitty $HOME/.config/kitty
    ln -sf $HOME/.config/nixpkgs/neovim $HOME/.config/nvim

    ln -sf $HOME/.config/nixpkgs/git/.gitconfig $HOME/.gitconfig
    ln -sf $HOME/.config/nixpkgs/git/.gitexcludes $HOME/.gitexcludes
    ln -sf $HOME/.config/nixpkgs/bash/.bashrc $HOME/.bashrc
  '';

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };
}
