{ pkgs, ... }:

{
  # doc: [treesitter](https://nix-community.github.io/nixvim/plugins/treesitter/index.html)
  # depencies: environment.systemPackages [ pkgs.clang ]
  # :TSInstall <grammar>
  programs.nixvim.plugins.treesitter = {
    enable = true;
    package = pkgs.vimPlugins.nvim-treesitter;
    
    # startup with nvim, not lazy load
    autoLoad = true;

    # foldering support: zc/zo to switch folding, zR to open all, zM to close all
    folding.enable = true;

    # NOTE: The keys are the parser names and the values are either one or several filetypes.
    languageRegister = {
      "gitignore" = ".gitignore";
      # conf = [ ".conf" "ini" ];
    };

    settings = {
      # NOTE: Set whether `nvim-treesitter` should automatically install the grammars.
      auto_install = true;
      indent.enable = true;
      ensure_installed = [
        "git_config"
        "git_rebase"
        "gitattributes"
        "gitcommit"
        "gitignore"
      ];
    };

    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      bash nix markdown json yaml toml
      vim vimdoc lua
      python c
      html css javascript  
    ];
  };
}