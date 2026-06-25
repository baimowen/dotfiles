{ inputs, ... }:

{
  programs.kitty = {
    enable = true;
    # font = "Maple Mono NF CN";
    font.size = 18;
    font.name = "Maple Mono NF CN";
    # see:  https://github.com/kovidgoyal/kitty-themes/tree/master/themes
    themeFile = "Catppuccin-Frappe";
    # shellIntegration.enableBashIntegration = true;
    settings = {
      scrollback_lines = 10000;
      update_check_interval = 0;
      cursor_trail = 3;
      cursor_shape = "block";
      hide_window_decorations = "titlebar-only";
      # window_padding_width = 15;
      # background_opacity = 0.8;
      background_blur = 60;
      remember_window_size = true;
      tab_bar_edge = "top";
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
    };
  };
}