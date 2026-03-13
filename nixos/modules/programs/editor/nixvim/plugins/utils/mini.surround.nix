{ pkgs, ... }:

{
  programs.nixvim.plugins.nvim-surround = {
    enable = true;
    settings.mappings = {
      mappings = {
        add = "ys";           # Add surrounding in Normal and Visual modes
        delete = "ds";        # Delete surrounding  
        find = "gs";          # Find surrounding (to the right)
        find_left = "gS";     # Find surrounding (to the left)
        highlight = "gss";    # Highlight surrounding
        replace = "cs";       # Replace surrounding
        update_n_lines = "gq";  # Update `n_lines`
      };
    };
  };
}