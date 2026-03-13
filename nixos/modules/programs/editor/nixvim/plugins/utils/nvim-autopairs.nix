{ pkgs, ... }:

{
  programs.nixvim.plugins.nvim-autopairs = {
    enable = true;
    # package = pkgs.vimPlugins.nvim-autopairs;
    autoLoad = true;
  };
}