{ pkgs, ... }:

{
  programs.neomutt = {
    enable = true;
    package = pkgs.neomutt;
    sort = "date";
    editor = "vim";
    vimKeys = true;
    checkStatsInterval = 60;
    settings = {
    };
    extraConfig = ''
    '';
    sidebar = {
      enable = true;
      # width = 22;
      format = "%D%?F? [%F]?%* %?N?%N/?%S";
    };
  };
  home.packages = with pkgs; [ mutt mailspring ];
}