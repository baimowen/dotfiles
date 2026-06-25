{ pkgs, ... }:

{
  services.kdeconnect.enable = true;
  services.kdeconnect.package = pkgs.kdePackages.kdeconnect-kde;
}