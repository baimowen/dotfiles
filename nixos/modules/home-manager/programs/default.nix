{ pkgs, ... }:

{
  home.packages = [
    pkgs.xdg-user-dirs
    pkgs.wmenu
    pkgs.dmenu-wayland
    pkgs.wlroots_0_20
    pkgs.wl-clipboard
    pkgs.slurp
    pkgs.grim
    pkgs.swaybg
    pkgs.networkmanagerapplet
    pkgs.pavucontrol
    pkgs.blueman
    pkgs.brightnessctl
    pkgs.libnotify
    pkgs.hyprlauncher
    pkgs.thunar
    pkgs.unzip
    pkgs.mpv
    pkgs.ffmpeg
    pkgs.bat
  ];
}