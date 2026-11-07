{ pkgs, ... }:

{
  home.packages = [
    # uitls
    pkgs.perl
    pkgs.fd
    pkgs.shc
    pkgs.bat
    pkgs.unzip
    pkgs.yt-dlp
    # pkgs.visidata  # A terminal interface for exploring and arranging tabular data.
    pkgs.gitlogue
    pkgs.imv
    pkgs.scrcpy
    pkgs.cpufetch
    pkgs.peaclock
    pkgs.parsec-bin
    pkgs.neovim-gtk  # gui for neovim
    pkgs.gnome-text-editor
    pkgs.obsidian
    pkgs.openlist
    pkgs.termius
    pkgs.winboat  # depended on podman/docker
    pkgs.kdePackages.okular  # pdf reader
    pkgs.kdePackages.kdenlive
    pkgs.audacity
    pkgs.gimp
    pkgs.losslesscut-bin
    pkgs.qbittorrent-enhanced
    pkgs.lx-music-desktop
    pkgs.spotify-player
    pkgs.spotube
    pkgs.pipes

    # game
    pkgs.osu-lazer-bin
    pkgs.shtris

    # Communication
    pkgs.wechat
    pkgs.telegram-desktop

    # entertainment
    pkgs.bilibili
  ];
}