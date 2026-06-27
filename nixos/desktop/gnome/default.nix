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

  # environment.systemPackages = [];

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