{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.nix-index  # search on nixpkgs which command in packages (nix-locate bin/command)
    pkgs.nix-prefetch-git
    pkgs.gnugrep
    pkgs.grex
    pkgs.gnused
    pkgs.gawk
    pkgs.strace
    pkgs.sysstat
    pkgs.iotop
    pkgs.lsof
    pkgs.psmisc  # Set of small useful utilities that use the proc filesystem (such as fuser, killall and pstree)
    pkgs.tree
    pkgs.file
    pkgs.lsof
    pkgs.xz
    pkgs.p7zip
    pkgs.unzip
    pkgs.tldr
    pkgs.jq
    pkgs.yq
    pkgs.njq  # Command-line JSON processor using nix as query language
    pkgs.dos2unix
    pkgs.expect  # Tool for automating interactive applications
    pkgs.gh
    # pkgs.act  # or use `gh extension install https://github.com/nektos/gh-act`
    pkgs.dive  # A tool for exploring a Docker image, layer contents, and discovering ways to shrink the size of your Docker/OCI image.
    # pkgs.hyperfine  # Command-line benchmarking tool
    pkgs.nitch  # Incredibly fast system fetch written in nim
    pkgs.duf
    pkgs.ncdu
    pkgs.rsync  # Fast incremental file transfer utility
    # pkgs.rsyncy  # Progress bar wrapper for rsync
    pkgs.hexdump
    pkgs.ffmpeg
    pkgs.pv  # pipe viewer
    pkgs.nmap
    pkgs.tcpdump
    pkgs.w3m
    pkgs.obscura  # Headless browser for AI agents and web scraping
    pkgs.ueberzugpp  # terminal image viewer
    # pkgs.wl-kbptr  # see: https://github.com/moverest/wl-kbptr
    pkgs.wlrctl  # move pointer
    pkgs.pdf-cli  # terminal pdf/epub viewer
    pkgs.xdg-user-dirs  # use `xdg-user-dirs-update` to generate user directories like `~/Desktop`, `~/Documents`, etc.

    # de
    # enable programs based on qt5/qt6 to 
    # run in native wayland mode
    pkgs.qt5.qtwayland
    pkgs.qt6.qtwayland
    pkgs.xwayland-satellite  # xwayland compatibility layer

    # controller
    pkgs.wlr-randr  # a display output management tool for wayland, used to adjust resolution, scaling, and screen orientation
    pkgs.pavucontrol  # pulseaudio volume control
    pkgs.brightnessctl  # brightness control

    # clipboard
    pkgs.wl-clipboard  # command-line copy/paste utilities for wayland
    pkgs.clipse  # clipboard manager(tui)

    # screenshot / screen recorder
    pkgs.grim  # screenshot utility for wayland
    pkgs.slurp  # select a region in a wayland compositor
    pkgs.gradia  # screenshot editor and annotator for wayland
    pkgs.wf-recorder  # recorder for wayland

    # background manager
    pkgs.waypaper  # wallpaper manager frontend
    pkgs.swaybg  # static wallpaper tool
    pkgs.awww  # dynamic wallpaper daemon
    pkgs.lxappearance  # gtk theme switcher
    pkgs.nwg-look

    # file manager
    pkgs.nautilus
    pkgs.nautilus-python
    pkgs.nautilus-open-any-terminal  # need to `ln -s /usr/bin/kitty /use/bin/gnoe-terminal
    # thumbnailer
    pkgs.tumbler  # thunmbnailer core backend
    pkgs.ffmpegthumbnailer  # video thumbnailer lib
    pkgs.poppler  # pdf thumbnailer lib
    # thumbnailer dependencies lib
    pkgs.gst_all_1.gst-libav
    pkgs.gst_all_1.gst-plugins-base
    pkgs.gst_all_1.gst-plugins-good

    # pkgs.wmenu  # dmenu on wayland
    pkgs.wayland-logout

    # gnome applications
    pkgs.gnome-control-center
    pkgs.gnome-system-monitor
    pkgs.baobab
    pkgs.menulibre
    pkgs.gnome-clocks
    pkgs.gnome-calculator
    pkgs.gnome-tweaks
    pkgs.dconf-editor
    pkgs.dconf2nix
  ];
}