{ config, pkgs, lib, ... }:

let
  sqlmux = pkgs.callPackage ./package.nix { };
in
{
  environment.systemPackages = [ sqlmux ];
}