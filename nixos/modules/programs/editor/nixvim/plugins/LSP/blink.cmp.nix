{ pkgs, ... }:

{
  programs.nixvim.plugins.blink-cmp = {
    enable = true;
    package = pkgs.vimPlugins.blink-cmp;
    setupLspCapabilities = true;
  };
}