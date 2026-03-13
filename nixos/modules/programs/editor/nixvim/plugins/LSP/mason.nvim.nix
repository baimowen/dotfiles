# :Mason to open mason window
{ pkgs, ... }: {
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      mason-nvim
      mason-lspconfig-nvim
    ];

    extraConfigLua = ''
      require("mason").setup({ ui = { border = "rounded" } })
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
        },
        automatic_installation = true,
      })
    '';
  };
}

# { pkgs, ... }: {
#   programs.nixvim.plugins.mason-nvim = {
#     enable = true;
#   };

#   programs.nixvim.plugins.mason-lspconfig = {
#     enable = true;
#     settings = {
#       ensure_installed = [
#         "nil_ls"
#         "bashls"
#         "pyright"
#       ];
#       automatic_installation = true;
#     };
#   };
# }