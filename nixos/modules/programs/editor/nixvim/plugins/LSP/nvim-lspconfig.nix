{ pkgs, ... }:

{
  programs.nixvim.plugins.lsp = {
    enable = true;
    package = pkgs.vimPlugins.nvim-lspconfig;
    servers = {
      # Nix
      nil_ls.enable = true;
      # Bash
      bashls.enable = true;
      # Python
      pyright.enable = true;
      # C/C++
      clangd.enable = true;
      # JSON
      jsonls.enable = true;
      # YAML
      yamlls.enable = true;
      # TOML
      taplo.enable = true;
    };
    capabilities = ''
      -- 启用 snippet 支持
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      -- 如果需要，可以加 resolveSupport
      capabilities.textDocument.completion.completionItem.resolveSupport = {
        properties = { "documentation", "detail", "additionalTextEdits" }
      }

      -- 支持折叠
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false;
        lineFoldingOnly = true;
      }
    '';
  };
}