{ pkgs, ... }:
{
  programs.nixvim.plugins.telescope = {
    enable = true;
    keymaps = {
      "<leader>ff" = {
        action = "find_files";
        options = {
          desc = "Telescope Find Files";
        };
      };
      "<leader>fg" = {
        action = "live_grep";
        options = {
          desc = "Telescope Live Grep";
        };
      };
      "<leader>gf" = {
        action = "git_files";
        options = {
          desc = "Telescope Git Files";
        };
      };
      "<leader>gc" = {
        action = "git_commits";
        options = {
          desc = "Telescope Git Commits";
        };
      };
      "<leader>gb" = {
        action = "git_branches";
        options = {
          desc = "Telescope Git Branches";
        };
      };

    };
    settings = {
      defaults = {
        file_ignore_patterns = [
          "^.git/"
          "^__pycache__/"
        ];
      };
      layout_config = {
        prompt_position = "bottom";
      };
      mappings = {
        i = {
          # "<A->" = {
          #   __raw = "require('telescope.actions').move_selection_next";
          # };
          # "<A->" = {
          #   __raw = "require('telescope.actions').move_selection_previous";
          # };
        };
      };
      selection_caret = "> ";
      set_env = {
        COLORTERM = "truecolor";
      };
      sorting_strategy = "descending";  # ascending | descending
    };
    extensions = {
      fzf-native = {
        enable = true;
        settings = {
          fuzzy = true;
          override_generic_sorter = true;
          override_file_sorter = true;
          case_mode = "smart_case";
        };
      };
    };
  };
  # dependencies
  environment.systemPackages = with pkgs; [ ripgrep fd fzf ];
}