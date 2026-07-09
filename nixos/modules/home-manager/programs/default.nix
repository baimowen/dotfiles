{ pkgs, ... }:

{
  home.packages = [
    # uitls
    pkgs.perl
    pkgs.fd
    pkgs.bat
    pkgs.unzip
    pkgs.yt-dlp
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

    # game
    pkgs.osu-lazer-bin
  ];
}