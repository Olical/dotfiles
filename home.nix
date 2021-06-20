{ config, pkgs, ... }:

let
  dag = config.lib.dag;
  pkg-list-opts = {
    pkgs = pkgs;
    unstable = import (fetchTarball https://nixos.org/channels/nixos-unstable/nixexprs.tar.xz) {};
  };
  minimal = import ./pkg-lists/minimal.nix pkg-list-opts;
  linked = import ./pkg-lists/linked.nix pkg-list-opts;
in
  {
    programs.home-manager.enable = true;
    home.stateVersion = "21.05";
    home.username = "$USER";
    home.homeDirectory = "/home/$USER";

    nixpkgs.config.allowUnfree = true;
    fonts.fontconfig.enable = true;

    nixpkgs.overlays = [
      (import (fetchTarball https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz))
    ];

    home.packages = minimal ++ linked;

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
      pinentryFlavor = "curses";
    };

    services.dropbox = {
      enable = true;
    };
  }
