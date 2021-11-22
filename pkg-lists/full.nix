{ pkgs, unstable }:

let
  thunar = pkgs.xfce.thunar.override { thunarPlugins = [pkgs.xfce.thunar-archive-plugin]; };
in
  with pkgs; [
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
    thunar
    unstable.discord
    unstable.obs-studio
    vlc
    xclip
    xfce.xfce4-screenshooter
    xss-lock
  ]
