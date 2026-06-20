{ config, pkgs, ... }:

{
  system.stateVersion = "26.05";
  boot.isContainer = true;

  users.users.localhost = {
    isNormalUser = true;
    createHome = true;
    extraGroups = [ "wheel" ];
  };

  services.openssh = {
    enable = true;
    permitRootLogin = "yes";
  };

  environment.systemPackages = with pkgs; [ vim ];

  services.nginx.enable = true;

  networking.firewall.allowedTCPPorts = [ 80 ];
}