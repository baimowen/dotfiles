{ config, pkgs, ... }:
  
{
  programs.fzf = {
    enable = true;
    defaultOptions = [
      "--height 40%"
      "--layout=reverse"
      "--border"
      "--ansi"
      "--multi"
    ];
    fileWidgetOptions = [ ];
    changeDirWidgetOptions = [ ];
  };
}
