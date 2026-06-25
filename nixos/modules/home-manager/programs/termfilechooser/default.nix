{ pkgs, ... }:

{
  home.packages = with pkgs; [ xdg-desktop-portal-termfilechooser ];
  # see: https://github.com/hunkyburrito/xdg-desktop-portal-termfilechooser/issues/56#issuecomment-3697512117
  home.file.".config/xdg-desktop-portal-termfilechooser/config".text = ''
    [filechooser]
    cmd=${pkgs.xdg-desktop-portal-termfilechooser}/share/xdg-desktop-portal-termfilechooser/lf-wrapper.sh
    default_dir=$HOME
    env=TERMCMD=kitty
    env=PATH="$PATH:/run/current-system/sw/bin"
    open_mode = suggested
    save_mode = last
  '';
}