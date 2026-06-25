{ pkgs, ... }:

{
  home.packages = [
    # uitls
    pkgs.perl
    pkgs.bat
    pkgs.unzip
    pkgs.yt-dlp
    pkgs.imv
    pkgs.scrcpy
    pkgs.cpufetch
    pkgs.peaclock
    pkgs.parsec-bin
    pkgs.obsidian
    pkgs.openlist
    pkgs.termius
    pkgs.winboat
    pkgs.kdePackages.okular  # pdf reader
    pkgs.kdePackages.kdenlive
    pkgs.losslesscut-bin
    pkgs.qbittorrent-enhanced

    # game
    pkgs.osu-lazer-bin
  ];
}