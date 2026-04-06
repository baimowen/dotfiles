{ config, lib, pkgs, ... }:

let
  package = pkgs.enhaoswen.dynamic-island-on-hyprland;
in
{
  imports = [
    ./module.nix
  ];

  config = {

    programs.dynamic-island-on-hyprland.enable = true;

    home.packages = [
      package
      pkgs.playerctl      # for media control
      pkgs.lyricsmpris    # for lyrics support
      pkgs.brightnessctl  # for brightness control
    ];

    home.file.".config/quickshell/IslandBackend/libIslandBackend.so" = {
      source = "${package}/lib/cmake/DynamicIsland/libIslandBackend.so";
    };

    home.file.".config/quickshell/IslandBackend/libIslandBackendplugin.so" = {
      source = "${package}/lib/cmake/DynamicIsland/libIslandBackendplugin.so";
    };

    home.file.".config/quickshell/IslandBackend/qmldir" = {
      source = "${package}/lib/cmake/DynamicIsland/qmldir";
    };

    # home.file.".config/quickshell/dynamic_island/libIslandBackend.so" = {
    #   source = "${package}/lib/cmake/DynamicIsland/libIslandBackend.so";
    # };

    # home.file.".config/quickshell/dynamic_island/libIslandBackendplugin.so" = {
    #   source = "${package}/lib/cmake/DynamicIsland/libIslandBackendplugin.so";
    # };

    home.sessionVariables = {
      QML2_IMPORT_PATH = "${config.home.homeDirectory}/.config/quickshell";
    };
  };
}