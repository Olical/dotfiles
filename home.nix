{ config, pkgs, ... }:

let
  dag = config.lib.dag;
  pkg-list-opts = {
    pkgs = pkgs;
    unstable = import (fetchTarball https://nixos.org/channels/nixos-unstable/nixexprs.tar.xz) {};
  };
  base = import ./pkg-lists/base.nix pkg-list-opts;
  active = import ./pkg-lists/active.nix pkg-list-opts;
in
  {
    programs.home-manager.enable = true;
    home.stateVersion = "21.05";
    home.username = "$USER";
    home.homeDirectory = "/home/$USER";

    nixpkgs.config.allowUnfree = true;
    fonts.fontconfig.enable = true;

    home.packages = base ++ active;

    programs.direnv.enable = true;
    programs.direnv.nix-direnv.enable = true;

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
  }
