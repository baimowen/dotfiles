{ inputs, ... }:

{
  programs.bat = {
    enable = true;
    # themes = {};  # defined in ../../themes/catppuccin/default.nix
    # see: `bat -L` to list syntax name
    # config.map-syntax = [
    #   "*.c:C Source File"
    #   "*.props:Java Properties"
    # ];
    config.pager = "less -FR";
  };
}