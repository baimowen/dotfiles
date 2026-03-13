{
  # -- 寄存器 --
  clipboard = "unnamedplus";  # 使用系统剪贴板作为默认寄存器
  undofile = true;            # 启用持久撤销

  # -- 行号 --
  number = true;           # 显示行号
  relativenumber = true;   # 显示相对行号

  # -- 缩进 --
  expandtab = true;        # 空格代替Tab
  tabstop = 2;             # Tab宽度
  shiftwidth = 2;          # 缩进宽度
  autoindent = true;       # 自动缩进
  smartindent = true;      # 智能缩进

  # -- 编码与换行 --
  fileformat = "unix";                 # 设置文件默认保存格式为 Unix (LF)
  fileformats = ["unix" "dos" "mac"];  # 文件格式检测优先级
  wrap = false;                        # 不换行显示

  # -- 窗口 --
  splitbelow = true;       # 新窗口在下面 

  # -- 光标 --
  cursorline = true;       # 启动光标行高亮
}
