{ pkgs, inputs, ... }:

{
  imports = [
    inputs.dms.nixosModules.dank-material-shell
  ];

  programs.dank-material-shell = {
    enable = true;
    # quickshell.packages = pkgs.quickshell;
    systemd.enable = true;
    systemd.restartIfChanged = true;
    # system.target = "niri.service";
    enableClipboardPaste = true;  # required wtype
    enableVPN = true;  # required glib networkmanager
    enableDynamicTheming = true;  # required matugen
    enableSystemMonitoring = true;  # required dgop
    enableCalendarEvents = true;  # required khal
    enableAudioWavelength = true;  # required cava
    plugins = {  # see: 
    };
  };

  # environment.systemPackages = with pkgs; [];
  environment.systemPackages = with pkgs; [
    # dms depencies
    pkgs.wtype
    pkgs.matugen
    pkgs.dux-gop
    pkgs.khal
  ];
}
