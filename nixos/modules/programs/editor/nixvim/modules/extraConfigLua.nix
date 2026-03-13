''
  vim.opt.termguicolors = true
  -- vim.opt.background = 'dark'

  -- 启用撤销文件： 文件关闭后仍能保留撤销历史
  vim.opt.undofile = true

  -- 透明背景
  -- vim.api.nvim_set_hl(0, 'Normal', { bg = 'NONE' })
  -- vim.api.nvim_set_hl(0, 'NonText', { bg = 'NONE' })
  -- vim.api.nvim_set_hl(0, 'LineNr', { bg = 'NONE' })
  -- vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'NONE' })
  for _,group in ipairs({"Normal", "NonText", "LineNr", "SignColumn"})do
    vim.api.nvim_set_hl(0, group, { bg = 'NONE' })
  end

  -- 判断是否在 SSH 环境
  local function is_ssh()
    return vim.env.SSH_CONNECTION
        or vim.env.SSH_CLIENT
        or vim.env.SSH_TTY
    end

  if is_ssh() then
    local function paste()
      -- 从默认寄存器 "" 中获取内容，并按换行符分割
      return {
        vim.fn.split(vim.fn.getreg(""), "\n"),
        vim.fn.getregtype(""), -- 同时返回寄存器类型
      }
    end
    -- NOTE: 在远程ssh连接的终端中使用osc52
    -- 这里要说明的是flash在使用该osc52接管复制时
    -- 无法使用flash的远程复制无法使用p粘贴请使用系统自带的粘贴快捷键
    -- 更推荐在远程链接时使用系统自带的粘贴快捷键
    vim.g.clipboard = {
      name = 'OSC 52',
      copy = {
        ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
        ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
      },
      paste = {
        ['+'] = paste,
        ['*'] = paste,
      },
    }
  end
''