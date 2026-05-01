-- lua/config/opts.lua

vim.o.clipboard = "unnamedplus"  -- 使用系统剪贴板作为默认寄存器

-- 行号设置
vim.o.number = true          -- 显示行号
vim.o.relativenumber = true  -- 显示相对行号

-- 缩进设置（Tab）
vim.o.expandtab = true      -- 将 Tab 转换为空格
vim.o.tabstop = 2           -- Tab 显示为 2 个字符宽度
vim.o.softtabstop = 2       -- 按 Tab 键时插入 2 个空格
vim.o.shiftwidth = 2        -- 自动缩进使用 2 个空格

-- 窗口与显示设置
vim.o.wrap = false          -- 禁用自动换行
vim.o.splitbelow = true     -- 新窗口在下方
vim.o.cursorline = true     -- 高亮当前行
vim.o.cursorcolumn = true   -- 高亮当前列

-- 状态栏设置
vim.o.laststatus = 2        -- 始终显示状态栏
-- 状态栏 UI 设置
vim.o.statusline = "%F%m%r%h%w\\ %=[%Y]\\ [%{&ff}]\\ [%l,%v]\\ [%p%%]"

-- 文件路径与搜索设置
vim.o.path = vim.o.path .. ",**"  -- 添加 ** 到 path
vim.o.wildmenu = true       -- 命令行自动补全菜单
vim.o.hlsearch = true       -- 高亮搜索结果
vim.o.ignorecase = true     -- 忽略大小写
vim.o.smartcase = true      -- 智能匹配大小写

-- 可选：额外推荐的一些常用设置
vim.o.termguicolors = true  -- 启用真彩色支持
vim.o.mouse = "a"           -- 启用鼠标支持
-- vim.o.undofile = true       -- 启用撤销持久化