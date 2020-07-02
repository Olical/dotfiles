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
    stow

    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
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
