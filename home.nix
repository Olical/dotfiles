{ config, pkgs, ... }:

# TODO discord, spotify, pynvim, node, rust, joker, clj-kondo

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
    clojure
    cowsay
    curl
    firefox
    fish
    fzf
    git
    gcc
    htop
    httpie
    kitty
    leiningen
    neovim
    ripgrep
    stow
    tree
    xclip
    lazygit

    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    fira-code
    fira-code-symbols
  ];

  home.activation.stow = dag.entryAfter [ "writeBoundary" ] ''
    cd $HOME/.config/nixpkgs
    stow --target=$HOME `ls -d */`
  '';

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };
}
