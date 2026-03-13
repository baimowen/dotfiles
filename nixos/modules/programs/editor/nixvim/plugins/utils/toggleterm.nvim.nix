{ pkgs, ... }:

{
  programs.nixvim.plugins.toggleterm = {
    enable = true;
    settings = {
      direction = "float";
      open_mapping = "[[<c-\\>]]";
      shell = "${pkgs.bash}/bin/bash --login";
      # on_create = "fastfetch";
      size = 10;
      float_opts = {
        border = "rounded";
        # width = 100;
        # height = 30;
        # winblend = 10;  # 窗口透明度
      };
    };
  };
}