{ pkgs, ... }:

{
  programs.niri = {
    enable = true;
    useNautilus = true;
  };
}
