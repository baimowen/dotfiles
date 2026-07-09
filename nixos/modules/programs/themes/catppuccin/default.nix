{ pkgs, inputs, ... }:

{
  imports = [
    inputs.catppuccin.nixosModules.catppuccin
  ];
  catppuccin = {
    enable = true;
    autoEnable = true;
    flavor = "macchiato";
    cache.enable = true;  # whether to enable the usage of catppuccin's binary cache.
    fcitx5.enableRounded = true;  # enable Catppuccin theme for Fcitx5 and enable rounded corners for the Fcitx5 theme.
    gtk.icon.enable = true;
    cursors.enable = false;
  };
}