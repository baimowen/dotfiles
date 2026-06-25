{ inputs, pkgs, ... }:

{
  # nix.settings = {
  #   substituters = [ "https://quickshell.cachix.org" ];
  #   trusted-substituters = [ "https://quickshell.cachix.org" ];
  #   trusted-public-keys = [ "quickshell.cachix.org-1:EdhKB4GHeFMKmTejkqcyzv9tX53dRdFqmW/sJWvxL3Q=" ];
  # };

  # if you want to use programs.quickshell, move quickshell-module to hm
  programs.quickshell = {
    enable = true;
    systemd.enable = true;
    activeConfig = null;
    configs = {
    };
  };

  # environment.systemPackages = with pkgs; [
  # home.packages = [
  #   inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.quickshell
  # ];
}