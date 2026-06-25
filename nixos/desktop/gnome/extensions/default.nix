{ pkgs, ... }:

{
  environment.systemPackages = [
    # Tahoe-theme
    pkgs.gnome-extension-manager
    pkgs.gnomeExtensions.dash-to-dock
    pkgs.gnomeExtensions.blur-my-shell
    pkgs.gnomeExtensions.open-bar
    pkgs.gnomeExtensions.gnome-40-ui-improvements
    pkgs.gnomeExtensions.tiling-shell
    pkgs.gnomeExtensions.user-themes
    pkgs.gnomeExtensions.vitals  # 系统监视器

    pkgs.gnomeExtensions.kimpanel  # 输入法状态栏
    # gnomeExtensions.appindicator  # 输入法状态栏
    pkgs.gnomeExtensions.paperwm  # 窗口管理
    pkgs.gnomeExtensions.gtile  # 窗口平铺
    pkgs.gnomeExtensions.drop-down-terminal  # 下拉式终端
    pkgs.gnomeExtensions.rounded-window-corners-reborn  # 圆角窗口
    pkgs.gnomeExtensions.app-menu-is-back  # 左上角应用菜单
    gnomeExtensions.logo-menu  # 左上角徽标菜单
    # gnomeExtensions.arcmenu  # 左上角徽标菜单
    pkgs.gnomeExtensions.coverflow-alt-tab
    pkgs.gnomeExtensions.fuzzy-app-search  # 模糊搜索
    gnomeExtensions.vitals  # 系统监视器
    gradience  # 主题切换器
    # gnomeExtensions.custom-accent-colors  # gtk3/gtk4主题切换
    # gnomeExtensions.tray-icons-reloaded  # 托盘图标重载并增强
    # gnomeExtensions.just-perfection  # 自定义界面
  ];
}