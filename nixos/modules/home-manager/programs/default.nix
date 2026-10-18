{ pkgs, ... }:

{
  home.packages = [
    # uitls
    pkgs.perl
    pkgs.fd
    pkgs.bat
    pkgs.unzip
    pkgs.yt-dlp
    pkgs.gh
    # pkgs.act  # or use `gh extension install https://github.com/nektos/gh-act`
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