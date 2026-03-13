{ pkgs, ...}:

{
  # lualine.nvim
  programs.nixvim.plugins.lualine = {
    enable = true;
    settings = {
      options = {
        theme = "catppuccin";
        section_separators = { left = ""; right = ""; };
        component_separators = { left = ""; right = ""; };
      };
      sections = {
        lualine_a = [ "mode" ];
        lualine_b = [ "branch" "diff" "diagnostics" ];
        lualine_c = [ "filename" ];
        lualine_y = [ "filetype" "progress" ];
        lualine_z = [ "location" ];
      };
      components = {
        lualine_z = [];
      };
    };
  };
}