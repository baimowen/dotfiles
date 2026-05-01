-- lua/plugins/example/example.lua
return {
  -- 必需：插件仓库路径
  "author/plugin-name",

  -- 可选：指定分支或版本
  branch = "main",
  tag = "1.0.0",
  commit = "abc123",

  -- 可选：插件别名
  name = "my-plugin",

  -- 可选：加载优先级（数字越小越早加载）
  priority = 1000,

  -- 可选：是否延迟加载
  lazy = false,  -- false=立即加载，true=按需加载

  -- 可选：依赖的其他插件
  dependencies = { "other/plugin" },

  -- 可选：构建命令
  build = ":TSUpdate",
  -- 或 build = "make",
  -- 或 build = function() ... end,

  -- 可选：配置函数（在插件加载后执行）
  config = function()
    require("plugin").setup({
      -- 插件配置选项
    })
  end,

  -- 可选：加载前的初始化
  init = function()
    -- 设置映射、命令等
  end,

  -- 可选：启用或禁用
  enabled = true,

  -- 可选：加载条件
  cond = function()
    return vim.fn.has("win32") == 1
  end,
}