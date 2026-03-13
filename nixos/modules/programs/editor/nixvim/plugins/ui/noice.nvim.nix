{ lib, ... }:

{
  programs.nixvim.plugins = {
    nui = {
      enable = true;
    };
    notify = {
      enable = true;
      settings.timeout = 2000;
    };
    noice = {
      enable = true;
      settings = {
        cmdline = {
          enabled = true;
          view = "cmdline_popup";
          format = {
            cmdline = { 
              pattern = "^:"; 
              icon = ""; 
              lang = "vim"; 
            };
            search_down = { 
              kind = "search"; 
              pattern = "^/"; 
              icon = " "; 
              lang = "regex"; 
            };
            search_up = { 
              kind = "search"; 
              pattern = "^%?"; 
              icon = " "; 
              lang = "regex"; 
            };
            # 过滤命令 (:!command)
            filter = { 
              pattern = "^:%s*!"; 
              icon = ""; 
              lang = "bash"; 
            };
          };
        };
      };
    };
  };
}