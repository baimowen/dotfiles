{ pkgs; ... } =

{
  # style examples = https =//github.com/Alexays/Waybar/wiki/Examples
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    systemd.enable = false;

    # settings = {
    #   mainBar = {
    #     layer = "top";
    #     position = "top";
    #     height = 30;
    #     spacing = 4;
    #     output = [ "eDP-1" ];

    #     modules-left = [ "niri/workspace" ];
    #     modules-center = [ "niri/window" ];
    #     modules-right = [
    #       "network"
    #       "bluetooth"
    #       # "pipewire"
    #       "battery"
    #       "clock"
    #       "custom/notification"
    #     ];

    #     "niri/workspaces" = {
    #       "on-click" = "activate";
    #       "format" = "{icon}";
    #       "format-icons" = {
    #         "default" = "󰄰";
    #         "active" = "󰄯";
    #       };
    #     };
    #     "niri/window" = {
    #       "tooltip" = false;
    #       "format" = "{}";
    #       "rotate" = 0;
    #       "rewrite" = {
    #         "^null$" = "Desktop"
    #       };
    #     };
    #     "battery" = {
    #       "states" = {
    #         # "good" = 90;
    #         "warning" = 30;
    #         "critical" = 15
    #       };
    #       "format" = "{capacity}\n{icon}";
    #       "format-full" = "{capacity}\n{icon}";
    #       "format-charging" = "{capacity}\n";
    #       "format-plugged" = "{capacity}\n";
    #       # "format-alt" = "{time} {icon}";
    #       "tooltip-format" = "{power} W; {timeTo}",
    #       # "format-good" = "";  # An empty format will hide the module
    #       # "format-full" = "";
    #       "format-icons" = [""; "", "", "", ""],
    #       "justify" = "center";
    #     };
    #     "clock" = {
    #     };
    #     "network" = {
    #       "format-icons" = {
    #         "wifi" = [
    #           "<span size='12pt'>󰤯</span>";
    #           "<span size='12pt'>󰤟</span>";
    #           "<span size='12pt'>󰤢</span>";
    #           "<span size='12pt'>󰤥</span>";
    #           "<span size='12pt'>󰤨</span>"
    #         ];
    #         "ethernet" = "<span size='12pt'>󰈀</span>";
    #         "disabled" = "<span size='12pt'>󰤭</span>";
    #         "disconnected" = "<span size='12pt'>󰤩</span>"
    #       };
    #       "format-wifi" = "{icon}";
    #       "format-ethernet" = "{icon}";
    #       "format-disconnected" = "{icon}";
    #       "format-disabled" = "{icon}";
    #       "interval" = 5;
    #       "tooltip-format" = "{essid}\t{gwaddr}";
    #       "on-click" = "rfkill toggle wifi";
    #       "on-click-right" = "nm-connection-editor";
    #       "tooltip" = true;
    #       "max-length" = 20
    #     };
    #     "bluetooth" = {
    #       "interval" = 5;
    #       "format-on" = "<span size='14pt'>󰂯</span>";
    #       "format-off" = "<span size='14pt'>󰂲</span>";
    #       "format-disabled" = "<span size='14pt'>󰂲</span>";
    #       "format-connected" = "<span size='14pt'>󰂱</span>";
    #       "format-no-controller" = "span size='14pt'>󰂯</span>";
    #       "tooltip" = true;
    #       "tooltip-format" = "{device_enumerate}";
    #       "tooltip-format-enumerate-connected" = "{device_address}";
    #       "tooltip-format-enumerate-connected-battery" = "{device_address} | Battery = {device_battery_percentage}%";
    #       "on-click" = "rfkill toggle bluetooth";
    #       "on-click-right" = "blueman-manager"
    #     };
    #     "custom/notification" = {
    #       "tooltip" = false;
    #       "format" = "{icon}";
    #       "format-icons" = {
    #         "notification" = "󰅸";
    #         "none" = "󰂜";
    #         "dnd-notification" = "󰅸";
    #         "dnd-none" = "󱏨";
    #         "inhibited-notification" = "󰅸";
    #         "inhibited-none" = "󰂜";
    #         "dnd-inhibited-notification" = "󰅸";
    #         "dnd-inhibited-none" = "󱏨"
    #       };
    #       "return-type" = "json";
    #       "exec-if" = "which swaync-client";
    #       "exec" = "swaync-client -swb";
    #       "on-click-right" = "swaync-client -d -sw";
    #       "on-click" = "swaync-client -t -sw";
    #       "escape" = true
    #     };
    #   };
    # };

    # style = {
    # };
  };
}