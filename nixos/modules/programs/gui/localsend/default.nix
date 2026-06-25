{ pkgs, ... }:

{
  programs.localsend.enable = true;
  programs.localsend.package = pkgs.localsend;
}