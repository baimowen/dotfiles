{ pkgs, ... }: 

{
  imports = [
    # ./extensions
    # ./extensions/example.nix
  ];

  services.desktopManager.gnome.enable = true;
  services.displayManager.gdm.enable = true;

  services.gnome = {
    # Disable gnome-initial-setup
    gnome-initial-setup.enable = false;

    # Disable core apps (we'll install what we want manually)
    core-apps.enable = false;

    # search and index service
    tinysparql.enable = true;
    localsearch.enable = true;

    # provides features like voice input and screen reading etc.
    at-spi2-core.enable = true;

    # user-level file share service, share dir ~/Public
    gnome-user-share.enable = true;

    gnome-settings-daemon.enable = true;

    # save the security credentials
    gnome-keyring.enable = true;

    # quick previewer for nautilus
    sushi.enable = true;
  };

  services.gvfs.enable = true;
  services.gvfs.package = pkgs.gvfs;

  programs.xwayland.enable = true;

  environment.systemPackages = [
    # de
    # pkgs.wl-kbptr  # see: https://github.com/moverest/wl-kbptr
    pkgs.qt5.qtwayland
    pkgs.qt6.qtwayland
    pkgs.xwayland-satellite  # xwayland 兼容层
    pkgs.wlr-randr
    pkgs.wlrctl  # move pointer
    pkgs.pavucontrol
    pkgs.wl-clipboard
    pkgs.clipse
    pkgs.grim
    pkgs.slurp
    pkgs.gradia
    pkgs.swaybg
    pkgs.swww
    pkgs.waypaper
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

  environment.gnome.excludePackages = [
    pkgs.gnome-backgrounds
    pkgs.gnome-video-effects
    pkgs.gnome-music
    pkgs.gnome-text-editor
    pkgs.gnome-tour
    pkgs.gnome-maps
    pkgs.gnome-user-docs
  ];
}