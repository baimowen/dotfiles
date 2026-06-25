{ pkgs, ... }:

{
  programs.niri = {
    enable = true;
    useNautilus = true;
    # settings = {
    #   outputs."eDP-1".scale = 1.25;
    # };
  };
}
