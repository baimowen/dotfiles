{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.nix-index  # search on nixpkgs which command in packages (nix-locate bin/command)
    pkgs.nix-prefetch-git
    pkgs.tree
    pkgs.xz
    pkgs.lf
    pkgs.tldr  # Simplified and community-driven man pages
    pkgs.jq  # Lightweight and flexible command-line JSON processor
    pkgs.yq  # Command-line YAML/XML/TOML processor - jq wrapper for YAML, XML, TOML documents
    pkgs.dos2unix  # Convert text files with DOS or Mac line breaks to Unix line breaks and vice versa
    # pkgs.hyperfine  # Command-line benchmarking tool
    pkgs.nitch  # Incredibly fast system fetch written in nim
    pkgs.duf  # Disk Usage/Free Utility - a better 'df' alternative
    pkgs.ncdu  # Disk usage analyzer with an ncurses interface
    pkgs.rsync  # Fast incremental file transfer utility
    # pkgs.rsyncy  # Progress bar wrapper for rsync
    pkgs.hexdump
    pkgs.nmap
    pkgs.tcpdump
    pkgs.w3m
    pkgs.ueberzugpp  # terminal image preview

    # de
    # pkgs.wl-kbptr  # see: https://github.com/moverest/wl-kbptr
    pkgs.qt5.qtwayland
    pkgs.qt6.qtwayland
    pkgs.xwayland-satellite  # xwayland 兼容层
    pkgs.wlr-randr
    pkgs.wlrctl  # move pointer
    pkgs.pavucontrol
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