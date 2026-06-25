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
  environment.systemPackages = with pkgs; [ lutris wine wine-wayland ];
  # nixpkgs.config.allowUnfreePredicate = pkg:
  #   builtins.elem (lib.getName pkg) [
  #     "steam-unwrapped"
  #   ];
}