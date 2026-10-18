{ lib, config, pkgs, ... }:

{
  programs.steam = {
    enable = true;
    package = pkgs.steam;
    # package = pkgs.steam.override {  # overlay
    #   extraEnv = {
    #     MANGOHUD = true;
    #     OBS_VKCAPTURE = true;
    #     RADV_TEX_ANISO = 16;
    #   };
    #   extraLibraries = p: with p; [
    #     atk
    #   ];
    # }
    fontPackages = builtins.filter lib.types.package.check config.fonts.packages;
    extraCompatPackages = with pkgs; [ proton-ge-bin ];
    extraPackages = with pkgs; [ gamescope ];
    gamescopeSession.enable = true;
  };
  environment.systemPackages = with pkgs; [
    # wine
    wine-wayland
    wineWow64Packages.full
    lutris

    # game runtime
    gamemode
    mangohud
    vulkan-tools
    vulkan-loader

    # graphics render
    dxvk
    vkd3d
  ];
  # nixpkgs.config.allowUnfreePredicate = pkg:
  #   builtins.elem (lib.getName pkg) [
  #     "steam-unwrapped"
  #   ];
}