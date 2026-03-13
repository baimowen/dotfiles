{ pkgs, ... }:

{
  programs.nixvim.plugins.lz-n = {
    enable = true;
    package = pkgs.vimPlugins.lz-n;
    autoLoad = true;
  };
}