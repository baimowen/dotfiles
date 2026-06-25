{ pkgs, ... }:

{
  programs.onlyoffice.enable = true;
  programs.onlyoffice.package = pkgs.onlyoffice-desktopeditors;
  # All configurable options can be deduced by enabling them through the GUI and observing the changes in ~/.config/onlyoffice/DesktopEditors.conf.
  programs.onlyoffice.settings = {
    UITheme = "theme-contrast-dark";
    editorWindowMode = false;
    forcedRtl = false;
    maximized = true;
    titlebar = "custom";
  };
}