{ pkgs, config, lib, ... }:

{
  # keyboard and inputmethod
  console.useXkbConfig = true; # use xkb.options in tty.
  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";
  # Select internationalisation properties.
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocales = [ "zh_CN.UTF-8/UTF-8" "zh_CN/GB2312" "zh_CN.GBK/GBK" ];
    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5.addons = with pkgs; [
        fcitx5-gtk
        qt6Packages.fcitx5-qt
        kdePackages.fcitx5-configtool
        kdePackages.fcitx5-chinese-addons
        kdePackages.fcitx5-with-addons
        fcitx5-rime
        rime-ice
      ];
      fcitx5.waylandFrontend = true;
    };
  };

  environment.systemPackages = with pkgs; [ mesa-demos libnotify ];

  # video
  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;
  # services.xserver.enable = true;
  # services.xserver.videoDrivers = [ "amdgpu" ];
  # environment.systemPackages = with pkgs; [ mesa-demos ];
  # load amd modules on initrd
  # boot.initrd.kernelModules = [ "amdgpu" ];
  # load NVIDIA modles on initrd
  # boot.initrd.kernelModules = [ "nvidia" "nvidia_modeset" ];

  # audio
  # services.pulseaudio.enable = true;
  # OR
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;  # gui manager

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # power supply
  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;
  
  # notice service
  services.dunst.enable = true;
  services.dunst.enableWayland = true;
  services.dbus.enable = true;
  # environment.systemPackages = with pkgs; [ libnotify ];

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
    config.common.default = lib.mkDefault [ "gtk" ];
  };

  # authentication
  security.polkit.enable = true;

  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      maple-mono.NF-CN
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-cjk-sans-static
      noto-fonts-cjk-serif-static
      nerd-fonts.jetbrains-mono
    ];
    fontconfig.defaultFonts = {
      serif = [ "Maple Mono NF CN" ];
      sansSerif = [ "Maple Mono NF CN" ];
      monospace = [ "Maple Mono NF CN" ];
    };
  };
}
