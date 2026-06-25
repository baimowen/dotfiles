{ pkgs, ... }:

{
  programs.translate-shell.enable = true;
  programs.translate-shell.package = pkgs.translate-shell;
  programs.translate-shell.settings = {
    # see: https://github.com/soimort/translate-shell/wiki/Configuration
    show-original = true;  # show orig text
    verbose = true;
    # indent = 2;  # is not of type `boolean or string or list of string
    view = false;  # true: use less to view; false: no-pager
    engine = "bing";
    # user-agent = "";
    hl = "en";
    tl = [ "zh" ];
  };
}