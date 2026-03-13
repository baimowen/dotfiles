{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      maple-mono.NF-CN
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-cjk-sans-static
      noto-fonts-cjk-serif-static
    ];
    fontconfig.defaultFonts = {
      serif = [ "Maple Mono NF CN" ];
      sansSerif = [ "Maple Mono NF CN" ];
      monospace = [ "Maple Mono NF CN" ];
    };
  };
}
