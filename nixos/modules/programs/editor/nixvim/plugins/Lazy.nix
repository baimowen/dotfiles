{ config, lib, pkgs, ... }:

{ pkgs, ... }: {
  programs.nixvim.plugins.lazy.enable = true;
  programs.nixvim.extraConfigLua = ''
    local lazy_ok, lazy = pcall(require, "lazy")
    if lazy_ok then
      lazy.setup({}, {
        checker = { enabled = false },
        change_detection = { enabled = false },
        performance = { cache = { enabled = false } },
        install = { missing = false },
        ui = {
          border = "rounded",
          icons = {
            cmd = "",
            config = "",
            event = "",
            ft = "",
            init = "",
            keys = "",
            plugin = "",
            runtime = "",
            source = "",
            start = "",
            task = "",
            lazy = "󰒲 ",
          },
        },
      })
    end
  '';
}
