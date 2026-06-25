{ pkgs, ... }:

{
  programs.cava = {
    enable = true;
    package = pkgs.cava;
    settings = {
      output = {
        channels = "mono";
        mono_option = "average";
      };
      color = {
        gradient = 2;
        gradient_color_1 = toString "'#c6d0f5'";
        gradient_color_2 = toString "'#babbf1'";
        gradient_color_3 = toString "'#8caaee'";
        gradient_color_4 = toString "'#85c1dc'";
        gradient_color_5 = toString "'#99d1db'";
        gradient_color_6 = toString "'#a6d189'";
        gradient_color_7 = toString "'#ca9ee6'";
        gradient_color_8 = toString "'#f4b8e4'";
      };
    };
  };
}