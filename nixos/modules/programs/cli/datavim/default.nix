{ config, pkgs, lib, ... }:

let
  datavim = pkgs.callPackage ./package.nix { };
in
{
  environment.systemPackages = [ datavim ];
}