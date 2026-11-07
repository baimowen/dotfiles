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
    pkgs.pv  # pipe viewer
    pkgs.nmap
    pkgs.tcpdump
    pkgs.w3m
    pkgs.ueberzugpp  # terminal image viewer
    pkgs.pdf-cli  # terminal pdf/epub viewer

    # de
    # pkgs.wl-kbptr  # see: https://github.com/moverest/wl-kbptr
    pkgs.qt5.qtwayland
    pkgs.qt6.qtwayland
    pkgs.xwayland-satellite  # xwayland 兼容层
    pkgs.wlr-randr
    pkgs.wlrctl  # move pointer
    pkgs.pavucontrol
    pkgs.brightnessctl
    pkgs.wf-recorder
    pkgs.wl-clipboard
    pkgs.clipse
    pkgs.grim
    pkgs.slurp
    pkgs.gradia
    pkgs.swaybg
    # pkgs.awww
    pkgs.waypaper
    pkgs.lxappearance
    pkgs.ffmpeg
    pkgs.nautilus
    pkgs.nautilus-python
    pkgs.nautilus-open-any-terminal  # need to `ln -s /usr/bin/kitty /use/bin/gnoe-terminal
    pkgs.poppler
    pkgs.tumbler
    pkgs.ffmpegthumbnailer
    pkgs.gst_all_1.gst-libav
    pkgs.gst_all_1.gst-plugins-base
    pkgs.gst_all_1.gst-plugins-good
    pkgs.xdg-user-dirs  # 使用 `xdg-user-dirs-update` 生成文件夹
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

    # dms depencies
    pkgs.wtype
    pkgs.matugen
    pkgs.dgop
    pkgs.khal
  ];
}