{ config, pkgs, ... }:

let
  homeDir = config.home.homeDirectory;
in
{
  services.mpd = {
    enable = true;
    enableSessionVariables = true;
    extraArgs = [ "--verbose" ];
    network.port = 6600;
    network.startWhenNeeded = true;  # enable systemd socket activation
    network.listenAddress = "0.0.0.0";
    dbFile = "${homeDir}/mpd/database";
    musicDirectory = "${homeDir}/Music";
    playlistDirectory = "${homeDir}/.config/mpd/playlist";
    extraConfig = ''
      restore_paused     "yes"
      auto_update        "yes"
      auto_update_depth  "10"
      audio_output {
        type    "pipewire"
        name    "PipeWire Sound Server"
      }
      audio_output {
        type    "fifo"
        name    "visualizer feed"
        path    "${homeDir}/mpd.fifo"
        format  "*:*:*"
      }
    '';  # in audio_output block, `format "44100:16:2"`: sampling rate 44,100Hz, bit depth 16bit, 2 channels (stereo)
  };

  home.packages = with pkgs; [ mpc ncmpcpp ];
}