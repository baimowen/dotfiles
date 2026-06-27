{ pkgs, ... }:

{
  programs.qutebrowser = {
    enable = true;
    loadAutoConfig = false;
    package = pkgs.qutebrowser;
    serachEngines = {
      w = "https://en.wikipedia.org/wiki/Special:Search?search={}&go=Go&ns0=1";
      nw = "https://wiki.nixos.org/index.php?search={}";
      aw = "https://wiki.archlinux.org/?search={}";
      google = "https://www.google.com/search?hl=en&q={}";
      bing = "https://bing.com/search?q={}";
    };
    quickmarks = {
      nixpkgs = "https://github.com/NixOS/nixpkgs";
      home-manager = "https://github.com/nix-community/home-manager";
    };
    settings = {
      colors = {
        hints = {
          bg = "#000000";
          fg = "#ffffff";
        };
        tabs.bar.bg = "#000000";
      };
      tabs.tabs_are_windows = true;
    };
    # extraConfig = ''
    # '';
    # keyBingdings = {};
    # keyMappings = {};
  };
}