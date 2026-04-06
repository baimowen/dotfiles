{ lib, ... }:

{
  options.programs.dynamic-island-on-hyprland = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      visible = false;
    };
  };
}