[
  { mode = "i"; key = "<M-h>"; action = "<C-o>h"; options.desc = "Move left"; }
  { mode = "i"; key = "<M-j>"; action = "<C-o>j"; options.desc = "Move down"; }
  { mode = "i"; key = "<M-k>"; action = "<C-o>k"; options.desc = "Move up"; }
  { mode = "i"; key = "<M-l>"; action = "<C-o>l"; options.desc = "Move right"; }

  # 系统剪贴板  dep: wl-clipboard(wayland)/xclip(x11)
  # { mode = [ "n" "v" ]; key = "<leader>c"; action = "\"+y"; options.desc = "Copy to system clipboard"; }
  # { mode = [ "n" "v" ]; key = "<leader>x"; action = "\"+d"; options.desc = "Cut to system clipboard"; }
  # { mode = [ "n" "v" ]; key = "<leader>p"; action = "\"+p"; options.desc = "Paste from system clipboard"; }

  # 行移动
  # { mode = "n"; key = "<A-j>"; action = ":m .+1<CR>=="; options.desc = "Move line down"; }
  # { mode = "n"; key = "<A-k>"; action = ":m .-2<CR>=="; options.desc = "Move line up"; }
  { mode = "v"; key = "<A-j>"; action = ":m '>+1<CR>gv=gv"; options.desc = "Move selection down"; }
  { mode = "v"; key = "<A-k>"; action = ":m '<-2<CR>gv=gv"; options.desc = "Move selection up"; }
]