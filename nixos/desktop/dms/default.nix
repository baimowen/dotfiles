{ pkgs, inputs, ... }:

{
  programs.dms-shell = {
    enable = true;
    # quickshell.packages = pkgs.quickshell;
    systemd.enable = true;
    systemd.restartIfChanged = true;
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
}
