{ pkgs, ... }:

{
  programs.btop = {
    enable = true;
    # Options to add to {file}btop.conf file.
    # See <https://github.com/aristocratos/btop#configurability> for options.
    settings = {
      theme_background = false;
    };
    # man 5 btop.conf
    extraConfig = ''
    '';
  };
}