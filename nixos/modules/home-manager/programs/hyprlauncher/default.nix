{ pkgs, ... }:

{
  services.hyprlauncher.enable = true;
  services.hyprlauncher.package = pkgs.hyprlauncher;
  services.hyprlauncher.settings = {
    enabled = true;
    grab_focus = true;
    default_finder = "desktop";
    desktop_icons = true;
    window_size = "400 260";
  };
}