{ pkgs, ... }:

{
  programs.mpv = {
    enable = true;
    config = {
      # driver
      hwdec = "vaapi";
      vo = "gpu";
      profile = "gpu-hq";
      audio-device = "pipewire";
      volume = 35;
      keep-open = true;
      gpu-context = "wayland";
      interpolation = "yes";
      video-sync = "display-resample";

      # player
      save-position-on-quit = true;

      # ui
      border = "no";
      keepaspect-window = "yes";
      osd-on-seek = "bar";
      osd-bar-w = 100;
      osd-bar-h = 2;
      osd-bar-align-y = -1;
      osd-border-size = 1;
      osd-font-size = 40;
      osd-fractions = "no";

      # screenshot
      screenshot-template = "~/Pictures/Screenshots/%F_%wM-%wS.%wT-N%n";
      screenshot-format = "png";
      screenshot-high-bit-depth = "yes";
      screenshot-jpeg-quality = 100;
      screenshot-jpeg-source-chroma = "yes";
      screenshot-webp-lossless = "no";
      screenshot-webp-quality = 100;
      screenshot-webp-compression = 0;
      screenshot-jxl-distance = 0.1;
      screenshot-tag-colorspace = "no";

      # cache
      cache = "yes";
      demuxer-max-bytes = "500M";
      demuxer-max-back-bytes = "100M";
    };
  };
}