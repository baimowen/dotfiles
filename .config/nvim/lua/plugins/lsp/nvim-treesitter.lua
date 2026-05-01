-- lua/plugins/lsp/nvim-treesitter.lua
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua", "markdown", },
      auto_install = true,
      highlight = { enable = true, },
      indent = { enable = true, },
    })

    vim.wo.foldmethod = 'expr'
    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
  end,
}