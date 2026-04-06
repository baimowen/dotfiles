{ config, lib, pkgs, ... }:

{
  programs.niri = {
    enable = true;
    # useNautilus = true;
    # settings = {
    #   outputs."eDP-1".scale = 1.25;
    # };
  };

  environment.systemPackages = with pkgs; [
    alacritty
    # kitty
    fuzzel
    # bibata-cursors
  ];

  environment.variables = {
    # XCURSOR_THEME = "Bibata-Modern-Ice";
    XCURSOR_SIZE = "24";  
  };
}
