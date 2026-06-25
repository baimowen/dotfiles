{ pkgs, ... }:

{
  services.playerctld.enable = true;
  services.playerctld.package = pkgs.playerctl;
  home.packages = with pkgs; [ playerctl ];
}