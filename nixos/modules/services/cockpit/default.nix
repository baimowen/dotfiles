{ pkgs, ... }:

{
  services.cockpit = {
    enable = true;
    port = 9090;
    openFirewall = true;
    plugins = [
      pkgs.cockpit-files
      pkgs.cockpit-machines
      pkgs.cockpit-podman
    ];
    settings = {};
  };
  networking.firewall.allowedTCPPorts = [ 9090 ];
}