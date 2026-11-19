{ pkgs, ... }:

{
  programs.localsend.enable = true;
  programs.localsend.package = pkgs.localsend;
  programs.localsend.openFirewall = true;
  networking.firewall.allowedTCPPorts = [ 53317 ];
}