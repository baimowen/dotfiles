{ inputs, pkgs, ... }:

{
  programs.quickshell = {
    enable = true;
    package = pkgs.quickshell;
  };
}