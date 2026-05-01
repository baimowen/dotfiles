-- lua/plugins/colorscheme/catppuccin.lua
return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  lazy = false,
  config = function()
    require("catppuccin").setup({
      flavour = "macchiato",
      background = {
        light = "latte",
        dark = "macchiato",
      },
    })
    -- setup must be called before loading
    -- vim.cmd.colorscheme "catppuccin-nvim"
    vim.cmd.colorscheme "catppuccin-nvim"
  end,
}