{ pkgs, ... }:

{
  services.blueman-applet.enable = true;
  services.blueman-applet.package = pkgs.blueman;
}