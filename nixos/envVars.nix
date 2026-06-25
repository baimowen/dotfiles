{ ... }:

{
  environment.variables = {
    # language
    LANG = "en_US.UTF-8";
    LANGUAGE = "en_US.UTF-8";
    LC_CTYPE = "zh_CN.UTF-8";
    LC_TIME = "zh_CN.UTF-8";
    LC_MESSAGES = "en_US.UTF-8";
    LC_COLLATE = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";

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