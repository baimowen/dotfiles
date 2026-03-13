{ pkgs, ... }:

{
  programs.nixvim = {
    plugins.comment = {
    enable = true;
      settings = {
        mappings = {
          basic = true;   # 启用基础键绑定
          extra = true;   # 启用额外键绑定
        };
        
        # 在注释和代码之间添加空格
        padding = true;
        
        # 注释后光标保持原位
        sticky = true;
      };
    };
    keymaps = [
      { mode = "n"; key = "<C-/>"; action = "gcc"; options = { desc = "Toggle comment line"; silent = true; }; }
      { mode = "v"; key = "<C-/>"; action = "gc"; options = { desc = "Toggle comment selection"; silent = true; }; }
      # { mode = "n"; key = "<leader>C"; action = "gcc"; options = { desc = "Toggle comment line"; silent = true; }; }
      # { mode = "v"; key = "<leader>C"; action = "gc"; options = { desc = "Toggle comment selection"; silent = true; }; }
    ];
  };
}