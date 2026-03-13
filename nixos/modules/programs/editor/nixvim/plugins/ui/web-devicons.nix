{ config, lib, pkgs, ... }:

{
  # barbar and nvim-tree dependencies
  programs.nixvim.plugins.web-devicons.enable = true;
}