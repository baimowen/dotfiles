{ config, pkgs, lib, ... }:

{
  programs.nixvim = {
    plugins."nvim-tree" = {
      enable = true;
      settings = {};
    };

    keymaps = [
      { mode = "n"; key = "<leader>e"; action = "<CMD>NvimTreeToggle<CR>"; options.desc = "[NvimTree] Toggle NvimTree"; }
    ];
  };
}