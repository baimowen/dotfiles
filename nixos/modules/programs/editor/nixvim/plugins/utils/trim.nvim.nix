{ pkgs, ... }:

{
  programs.nixvim.plugins.trim = {
    enable = true;
    # autoLoad = true;
    settings = {
      highlight = true;
      # highlight_bg = "#96e3b4ff";
      trim_first_line = false;
      trim_on_write = true;
    };
  };
}