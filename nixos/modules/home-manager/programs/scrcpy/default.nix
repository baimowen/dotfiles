{ pkgs, ... }:

{
  home.packages = [
    (pkgs.callPackage ./package.nix {
      version = "2.11.1";  # 2026.5.19 release
    })
    pkgs.scrcpy
    pkgs.android-tools
  ];
}