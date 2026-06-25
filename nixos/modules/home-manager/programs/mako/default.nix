{ pkgs, ... }:

{
  services.mako.enable = true;
  services.mako.settings = {
    # default-timeout = 5000  # 5s
    # # ===== 基础样式 =====
    # width=300
    # height=80
    # margin=10
    # padding=10
    # border-size=1
    # border-radius=8
    # font="Maple Mono NF CN 10"
    # sort=-time                  ; 排序方式
    # layer=overlay               ; 显示层级
    # background-color=#2e34407f  ; 背景颜色
    # width=420                   ; 通知宽度
    # height=120                  ; 通知高度
    # border-size=3               ; 边框宽度
    # border-color=#99c0d0        ; 边框颜色
    # border-radius=12            ; 圆角半径
    # icons=0                     ; 是否启用图标
    # max-icon-size=64            ; 图标大小
    # default-timeout=5000        ; 超时时间
    # ignore-timeout=0            ; 忽略超时时间
    # font="Noto Sans CJK SC 14"  ; 字体
    # margin=12                   ; 通知的外边距
    # padding=12,20               ; 通知的内边距
  };
  services.mako.extraConfig = ''
  '';
}