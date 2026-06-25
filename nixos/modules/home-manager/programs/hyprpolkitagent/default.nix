{ pkgs, ... }:

{
  services.hyprpolkitagent.enable = true;
  services.hyprpolkitagent.package = pkgs.hyprpolkitagent;
}