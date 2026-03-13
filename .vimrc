set clipboard=unnamedplus  " 使用系统剪贴板作为默认寄存器

set number          " 显示行号
set relativenumber  " 显示相对行号

" 缩进(tab)
set expandtab      " 将 Tab 转换为空格
set tabstop=2      " Tab 显示为 2 个字符宽度
set softtabstop=2  " 按 Tab 键时插入 2 个空格
set shiftwidth=2   " 自动缩进使用 2 个空格

" 窗口分割 默认: C-w + s/v 水平/垂直

set undofile      " 启用持久化撤销功能
set nowrap        " 禁用自动换行
set splitbelow    " 新窗口在下方
set cursorline    " 高亮当前行
set cursorcolumn  " 高亮当前列

" 语法高亮
syntax on
filetype plugin indent on

set laststatus=2                                              " 始终显示状态栏
set statusline=%F%m%r%h%w\ %=[%Y]\ [%{&ff}]\ [%l,%v]\ [%p%%]  " 状态栏ui设置

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**
set wildmenu
set hlsearch    " 高亮搜索结果
set ignorecase  " 忽略大小写
set smartcase   " 智能匹配大小写

" TAG JUMPING
" echo expand("%")  show current file path
" Create the `tags` file (may need to install `ctags` first)
command! MakeTags !ctags -R .
" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambinguous tags
" - Use ^t to jump back up the tag stack