{ config, lib, pkgs, ... }:

{
  programs.nixvim = {
    plugins.barbar = {
      enable = true;

      settings = {
        auto_hide = 1;
        sidebar_filetypes = {
          NvimTree = true;
        };
      };
    };

    globals.barbar_auto_setup = false;

    keymaps = [
      { mode = "n"; key = "<A-h>"; action = "<CMD>BufferMovePrevious<CR>"; options.desc = "[Buffer] Move buffer left"; }
      { mode = "n"; key = "<A-l>"; action = "<CMD>BufferMoveNext<CR>";     options.desc = "[Buffer] Move buffer right"; }
      { mode = "n"; key = "<A-1>"; action = "<CMD>BufferGoto 1<CR>";       options.desc = "[Buffer] Go to buffer 1"; }
      { mode = "n"; key = "<A-2>"; action = "<CMD>BufferGoto 2<CR>";       options.desc = "[Buffer] Go to buffer 2"; }
      { mode = "n"; key = "<A-3>"; action = "<CMD>BufferGoto 3<CR>";       options.desc = "[Buffer] Go to buffer 3"; }
      { mode = "n"; key = "<A-4>"; action = "<CMD>BufferGoto 4<CR>";       options.desc = "[Buffer] Go to buffer 4"; }
      { mode = "n"; key = "<A-5>"; action = "<CMD>BufferGoto 5<CR>";       options.desc = "[Buffer] Go to buffer 5"; }
      { mode = "n"; key = "<A-6>"; action = "<CMD>BufferGoto 6<CR>";       options.desc = "[Buffer] Go to buffer 6"; }
      { mode = "n"; key = "<A-7>"; action = "<CMD>BufferGoto 7<CR>";       options.desc = "[Buffer] Go to buffer 7"; }
      { mode = "n"; key = "<A-8>"; action = "<CMD>BufferGoto 8<CR>";       options.desc = "[Buffer] Go to buffer 8"; }
      { mode = "n"; key = "<A-9>"; action = "<CMD>BufferGoto 9<CR>";       options.desc = "[Buffer] Go to buffer 9"; }
      { mode = "n"; key = "<A-p>"; action = "<CMD>BufferPrevious<CR>";     options.desc = "[Buffer] Previous buffer"; }
      { mode = "n"; key = "<A-n>"; action = "<CMD>BufferNext<CR>";         options.desc = "[Buffer] Next buffer"; }
    ];
  };
}