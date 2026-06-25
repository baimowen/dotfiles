{ pkgs, lib, ... }:

let
  files = builtins.filter
    (name:
      let
        # isNix = builtins.match ".*\\.nix$" name != null;
        isNix = builtins.hasSuffix ".nix" name;
        isNotDefault = name != "default.nix";
      in
        isNix && isNotDefault
    )
    (builtins.attrNames (builtins.readDir ./.));
  importsList = map (name: ./. + "/${name}") files;
in
{
  imports = importsList; 
}