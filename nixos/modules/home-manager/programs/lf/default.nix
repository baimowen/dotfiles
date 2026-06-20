{ pkgs, ... }:

{
  programs.lf = {
    enable = true;
    settings = {
      hidden = true;
      preview = true;
      sixel = true;
      ignorecase = true;

      ratios = [ 1 1 2 ];
      info = "size";
      shell = "${pkgs.bash}/bin/bash";
      shellopts = "-euo pipefail";

      number = true;
      tabstop = 4;
    };
    extraConfig = ''
    '';
  };
}