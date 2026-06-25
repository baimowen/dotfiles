{ config, lib, pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/shell/extensions/dash-to-dock" = {
      dock-position = "BOTTOM";
      dash-max-icon-size = 32;
      application-inew-workspace = true;
    };
  };
}