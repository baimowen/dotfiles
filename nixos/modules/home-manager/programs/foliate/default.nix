{ pkgs, inputs, ... }:

{
  programs.foliate = {
    enable = true;
    package = pkgs.foliate;
    themes = { };
    settings = { };
  };
}