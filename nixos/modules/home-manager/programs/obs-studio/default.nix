{ pkgs, ... }:

{
  programs.obs-studio.enable = true;
  programs.obs-studio.package = pkgs.obs-studio;
  # programs.obs-studio.enableVirtualCamera = false;
  programs.obs-studio.plugins = [];
}