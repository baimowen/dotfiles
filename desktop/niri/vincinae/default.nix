{ pkgs, inputs, ... }:

{
  imports = [
    vicinae.homeManagerModules.default
    # ./extensions/example.nix
  ];

  # enable cachix cache
  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  services.vicinae = {
    enable = true;
    autoStart = true;
    settings = {
        faviconService = "twenty"; # twenty | google | none
        font.size = 11;
        popToRootOnClose = false;
        rootSearch.searchFiles = false;
        theme.name = "vicinae-dark";
        window = {
          csd = true;
          opacity = 0.95;
          rounding = 10;
        };
    };
    extensions = [ ];
  };
}