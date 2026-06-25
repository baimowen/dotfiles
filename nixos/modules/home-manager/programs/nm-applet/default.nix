{ pkgs, ... }:

{
  services.network-manager-applet.enable = true;
  services.network-manager-applet.package = pkgs.networkmanagerapplet;
}