{ config, pkgs, lib, ... }:

let
  custompkg = pkgs.callPackage ./package.nix { };
in
{
  home.packages = [ custompkg ];
}