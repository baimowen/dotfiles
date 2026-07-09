{ inputs, pkgs, ... }:

{
  imports = [ inputs.catppuccin.homeModules.catppuccin ];
  catppuccin = {
    enable = true;
    autoEnable = true;
    flavor = "macchiato";

    fzf.enable = true;
    fzf.flavor = "macchiato";
    
    bat.enable = true;
    bat.flavor = "macchiato";

    cava.enable = true;
    cava.flavor = "macchiato";

    btop.enable = true;
    btop.flavor = "macchiato";
  };
}