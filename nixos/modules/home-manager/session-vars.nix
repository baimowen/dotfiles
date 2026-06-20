{ ... }:

{
  home.sessionVariables = {
    # cursor style
    XCURSOR_SIZE = "24";
    # XCURSOR_THEME = "Bibata-Modern-Ice";
    # HYPRCURSOR_SIZE = "24";

    # language
    LANG = "en_US.UTF-8";
    LC_CTYPE = "zh_CN.UTF-8";
    LC_TIME = "zh_CN.UTF-8";
    LC_MESSAGES = "en_US.UTF-8";
    LC_COLLATE = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";

    # wayland
    XDG_SESSION_TYPE = "wayland";
    GDK_BACKEND = "wayland,x11";  # gtk application backend
    QT_QPA_PLATFORM = "wayland;xcb";  # qt application backend
    SDL_VIDEODRIVER = "wayland,x11";  # sdl(simple directmedia layer) library video driver
    CLUTTER_BACKEND = "wayland";  # clutter graphics library backend

    # wayland fcitx
    XMODIFIERS = "@im=fcitx";
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    INPUT_METHOD = "fcitx5";

    # software
    # WLR_RENDERER = "pixman";
    # LIBGL_ALWAYS_SOFTWARE = "1";
    # GBM_BACKEND = "llvmpipe";
    # GALLIUM_DRIVER = "llvmpipe";
    # __GLX_VENDOR_LIBRARY_NAME = "mesa";
  };
}