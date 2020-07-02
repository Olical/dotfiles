{ config, pkgs, ... }:

# TODO discord, spotify, pynvim, node, rust, joker, clj-kondo
# TODO clipman or similar
# TODO Mappings and theme for i3
# TODO vim-clap binary

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

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    clojure
    cowsay
    curl
    discord
    firefox
    fish
    fzf
    gcc
    git
    htop
    httpie
    kitty
    lazygit
    leiningen
    neovim
    ripgrep
    stow
    tree
    xclip

    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    fira-code
    fira-code-symbols
  ];

  services.redshift = {
    enable = true;
    latitude = "51.5074";
    longitude = "0.1278";
  };

  home.activation.stow = dag.entryAfter [ "writeBoundary" ] ''
    cd $HOME/.config/nixpkgs
    stow --target=$HOME `ls -d */`
    systemctl --user start redshift
  '';

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };
}
