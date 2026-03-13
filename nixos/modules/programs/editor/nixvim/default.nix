{ config, lib, pkgs, inputs, ... }:

{ 
  imports = [ 
    # inputs.nixvim.homeModules.nixvim
    inputs.nixvim.nixosModules.nixvim
    # ./plugins/Lazy.nix
    ./plugins/LSP/nvim-treesitter.nix
    ./plugins/LSP/mason.nvim.nix
    ./plugins/LSP/nvim-lspconfig.nix
    ./plugins/LSP/blink.cmp.nix
    ./plugins/ui/lualine.nvim.nix
    ./plugins/ui/barbar.nvim.nix
    ./plugins/ui/nvim-tree.nix
    ./plugins/ui/web-devicons.nix
    ./plugins/ui/noice.nvim.nix
    ./plugins/utils/nvim-autopairs.nix
    ./plugins/utils/rainbow-delimiters.nvim.nix
    ./plugins/utils/gitsigns.nvim.nix
    ./plugins/utils/trim.nvim.nix
    ./plugins/utils/comment.nvim.nix
    ./plugins/utils/toggleterm.nvim.nix
    ./plugins/utils/telescope.nvim.nix
    # ./plugins/utils/smartyank.nvim.nix
  ];

  # home.packages = with pkgs; [
  environment.systemPackages = with pkgs; [
    nil alejandra statix              # nix
    bash-language-server shellcheck   # shell
    pyright                     # python
    clang-tools                 # c/c++
    vscode-json-languageserver  # json
    yaml-language-server        # yaml
    taplo                       # toml
  ];

  programs.nixvim = {
    enable = true;
    # defaultEditor = true;

    globals.mapleader = " ";

    # clipboard = {
    #   register = "unnamedplus";
    #   providers.wl-copy.enable = true;
    # };

    opts = import ./modules/opts.nix;

    # keybindings
    keymaps = import ./modules/keymaps.nix;

    # colorScheme: catppuccin-mocha
    colorschemes = import ./modules/colorschemes.nix;

    # plugins = { };

    # extraPlugins = with pkgs.vimPlugins; [ ];

    extraConfigLua = import ./modules/extraConfigLua.nix;
  };
}
