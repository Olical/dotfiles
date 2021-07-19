{ pkgs, unstable }:

let
  thunar = pkgs.xfce.thunar.override { thunarPlugins = [pkgs.xfce.thunar-archive-plugin]; };
  dwarf-fortress = (unstable.dwarf-fortress-packages.dwarf-fortress-full.override {
    dfVersion = "0.47.05";
    enableIntro = false;
    enableSound = false;
    enableFPS = true;
  });
in
  with pkgs; [
    baobab
    bitwarden
    bitwarden-cli
    dwarf-fortress
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
  ]
