{ pkgs, ... }:

{
  programs.clash-verge = {
    enable = true;
    package = pkgs.clash-verge-rev;
    group = "wheel";
    # autoStart = true;
    # Whether to set the capabilities required for TUN mode.
    # Without these capabilities, Clash Verge’s DNS settings will not work in TUN mode.
    # When enabled, reverse path filtering will be set to loose instead of strict.
    tunMode = true;
    serviceMode = true;
  };
}