{ config, pkgs, ... }:

{
  # install mattermost-desktop and add server url: http://<server_ipaddr>:8065
  # or use the web at http://<server_ipaddr>:8065
  services.mattermost = {
    enable = true;
    siteUrl = "http://localhost:8065";
    host = "0.0.0.0";
    port = 8065;
    mutableConfig = true;
  };

  networking.firewall.allowedTCPPorts = [ 8065 ];
}