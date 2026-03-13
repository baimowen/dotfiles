{ pkgs, ... }:

{
  programs.nixvim.plugins.gitsigns = {
    enable = true;
    # package = pkgs.vimPlugins.gitsigns-nvim;
    autoLoad = true;
  };
}