{ config, pkgs, inputs, lib, ... }:

{
  imports = [
    inputs.dankmaterialshell.nixosModules.default  # simple as flake.nix inputs
  ];

  programs.dms-shell = {
    enable = true;
    
    # quickshell.package = inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.quickshell;
    
    systemd.enable = false;

    # enableSystemMonitoring = true;
    # enableClipboard = true;
    # enableDynamicTheming = true;
    # enableAudioWavelength = true;
    # enableVPN = true;
  };

  home.packages = [
    inputs.dankmaterialshell.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
