### 前言

这个文件是用来记录我的插件列表

尽管nix的声明式配置已经能够清晰完整地记录我曾经安装过的插件

但是光看插件名字看不出来**哪些插件是用来干什么事**。

所以这就是这个文件的作用。

[插件仓库](https://nix-community.github.io/nixvim/plugins/comment/settings/index.html)

### 使用字体

[Maple Mono Nerd Font NF CN](https://github.com/subframe7536/Maple-font)

### 插件列表

* [Lazy.nvim ](https://github.com/folke/lazy.nvim)
  
  插件管理器


* **开发方面**

  >[!note]
  >
  > [语言服务器协议（Language Server Protocol, LSP）](https://github.com/microsoft/language-server-protocol),对开发工具与语言服务器进程之间交换信息进行标准化

  * [nvim-treesitter ](https://github.com/nvim-treesitter/nvim-treesitter)
  
    解析源码，生成语法树，提供基于语法树的的代码高亮

  * [mason.nvim ](https://github.com/mason-org/mason.nvim)

    用于下载 LSP

  * [nvim-lspconfig ](https://github.com/neovim/nvim-lspconfig)

    用于配置 LSP

  * [blink.cmp ](https://github.com/Saghen/blink.cmp)

    代码补全引擎，用于显示 LSP 提供的补全结果

  * [nvim-autopairs ](https://github.com/windwp/nvim-autopairs)

    自动补全关闭括号，同时自动补全括号内的缩进

  * [gitsigns.nvim ](https://github.com/lewis6991/gitsigns.nvim)

    显示文件 git 状态

  * [telescope.nvim ](https://github.com/nvim-telescope/telescope.nvim)

    文件搜索和选择

  * [toggleterm.nvim ](https://github.com/akinsho/toggleterm.nvim)

    快捷键展开shell

  * [Comment.nvim ](https://github.com/numToStr/Comment.nvim)

    通过自定义快捷键实现选定内容快速注释

  * [trim.nvim ](https://github.com/cappyzawa/trim.nvim)

    保存时自动删除语句末尾空白字符以及多余换行

  * [nvim-ufo ](https://github.com/kevinhwang91/nvim-ufo)

    折叠代码块  （已经由 treesitter 实现，故不做额外安装）

  * [smartyank.nvim ](https://github.com/BufWinEnter/smartyank.nvim)

    将内容复制到系统剪贴板而不是 nvim 寄存器  （暂时找不到对应的 nix 插件）

  * [mini.surround ](https://github.com/echasnovski/mini.surround)

    快速为选定内容添加引号、括号等  （可通过C-o配合跳转命令e进行插入引号括号，故未进行安装）

  * [nvim-lint ](https://github.com/mfussenegger/nvim-lint)

    对代码中一些语法/拼写/潜在问题等进行提示（行内）  （尚未安装）

  * [trouble.nvim  ](https://github.com/folke/trouble.nvim)

    代码诊断显示（提示框）  （尚未安装）

  * [flash.nvim ](https://github.com/folke/flash.nvim)

    该插件仅作记录，并未进行安装。由 vim 原生功能*行跳转+单词跳转*优化而来，保持插件最少原则

    进入跳转模式后，光标快速跳转到指定单词

  * [multicursor ](https://gituhb.com/jake-stewart/multicursor.nvim)

    该插件仅作记录，并未进行安装。由 vim 原生功能*块选择*优化而来，保持插件最少原则

    可以在指定行首/行尾添加内容

  * [todo-comments.nvim ](https://github.com/folke/todo-comments.nvim)

    该插件仅作记录，并未进行安装。作用有限，保持插件最少原则

    对代码中一些特殊标记的注释进行高亮显示

* **界面美化**

  * [lualine.nvim ](https://github.com/nvim-lualine/lualine.nvim)

    nvim 底部状态栏：用于展示 nvim 信息如mode、encode、platform、language等

  * [barbar.nvim ](https://github.com/romgrk/barbar.nvim)

    nvim 顶部标签栏：用于切换打开的文件

  * [rainbow-delimiters.nvim ](https://github.com/hiphish/rainbow-delimiters.nvim)

    彩色括号：不同深度的括号显示不同颜色

  * [noice.nvim ](https://github.com/folke/noice.nvim)

    更好的弹出菜单和消息提示

  * [nvim-tree ](https://github.com/nvim-tree/nvim-tree.lua)

    展开当前目录下文件列表

* [snacks.nvim ](https://github.com/folke/snacks.nvim)

  提升 nvim 使用体验的工具包，包括但不限于：

    - [x] 动画

    - [x] UI

    - [x] 图片显示

    - [x] 内容选择（picker）

    - [x] 终端

    - [x] ... 

  * [lazydev.nvim ](https://github.com/folke/lazydev.nvim)

    消除 **Undefined global \`vim`** 警告

  * [which-key.nvim ](https://github.com/folke/which-key.nvim)

    显示定义的快捷键列表