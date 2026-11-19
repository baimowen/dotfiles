{ pkgs, inputs, ... }:

{
  wayland.windowManager.niri = {
    enable = true;
    systemd.enable = true;
    package = pkgs.niri;
    portalPackage = pkgs.xdg-desktop-portal-gnome;
    xwaylandSatellitePackage = pkgs.xwayland-satellite;
    settings = {
      hotkey-overlay = {};
      screenshot-path = "~/Pictures/Screenshots/Screenshot_%Y-%m-%d_%H-%M-%S.png";

      layout = {
        gaps = 8;
        center-focused-column = "never";
        preset-column-widths._children = [
          { proportion = 0.33333; }
          { proportion = 0.5; }
          { proportion = 0.66667; }
        ];
        default-column-width.proportion = 0.5;
        focus-ring = {
          width = 2;
          active-color = "#7fc8ffcc";
          inactive-color = "#505050";
        };
        border = {
          off = {};
          width = 1;
          active-color = "#ffc87f";
          inactive-color = "#505050";
          urgent-color = "#9b0000";
        };
        shadow = {
          softness = 30;
          spread = 5;
          offset._props = { x = 0; y = 5; };
          color = "#0007";
        };
        struts = {};
      };

      blur = {
        passes = 3;
        offset = 3;
        noise = 0.02;
        saturation = 1.5;
      };

      prefer-no-csd = true;
      animations = {};

      input = {
        keyboard = {
          xkb = {};
          numlock = {};
        };
        touchpad = {
          tap = {};
          natural-scroll = {};
        };
        mouse = {
          accel-speed = 0.2;
          accel-profile = "flat";
          scroll-factor._props = { horizontal = 2.0; vertical = -1.0; };
        };
        trackpoint = {};
      };

      cursor = {
        xcursor-size = 50;
        hide-after-inactive-ms = 15000;
      };

      environment = {};

      binds = {
        "Mod+Shift+Slash".show-hotkey-overlay = {};

        "Mod+T" = {
          _props.hotkey-overlay-title = "Open a Terminal: kitty";
          spawn = [ "kitty" ];
        };
        "Mod+E" = {
          _props.hotkey-overlay-title = "Open a FileManager: nautilus";
          spawn = [ "nautilus" ];
        };
        "Mod+R" = {
          _props.hotkey-overlay-title = "Run an Application: vicinae";
          spawn = [ "vicinae" "open" ];
        };
        "Mod+G" = {
          _props.hotkey-overlay-title = "Open Grid: wl-kbptr";
          spawn = [ "wl-kbptr" "-o" "modes=tile,bisect" ];
        };
        "Mod+Ctrl+G" = {
          _props.hotkey-overlay-title = "Open Hint";
          spawn = [ "wl-kbptr" "-o" "modes=floating,click" ];
        };
        "Mod+Comma" = {
          _props.hotkey-overlay-title = "Click the mouse legt: wlrctl";
          spawn = [ "wlrctl" "pointer" "click" "left" ];
        };
        "Mod+Period" = {
          _props.hotkey-overlay-title = "Click the mouse right: wlrctl";
          spawn = [ "wlrctl" "pointer" "click" "right" ];
        };
        "Mod+Slash" = {
          _props.hotkey-overlay-title = "Click the mouse middle: wlrctl";
          spawn = [ "wlrctl" "pointer" "click" "middle" ];
        };

        XF86AudioRaiseVolume = {
          _props.allow-when-locked = true;
          spawn-sh = [ "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+" ];
        };
        XF86AudioLowerVolume = {
          _props.allow-when-locked = true;
          spawn-sh = [ "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-" ];
        };
        XF86AudioMute = {
          _props.allow-when-locked = true;
          spawn-sh = [ "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle" ];
        };
        XF86AudioMicMute = {
          _props.allow-when-locked = true;
          spawn-sh = [ "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle" ];
        };
        XF86AudioPlay = {
          _props.allow-when-locked = true;
          spawn-sh = [ "playerctl play-pause" ];
        };
        XF86AudioStop = {
          _props.allow-when-locked = true;
          spawn-sh = [ "playerctl stop" ];
        };
        XF86AudioPrev = {
          _props.allow-when-locked = true;
          spawn-sh = [ "playerctl previous" ];
        };
        XF86AudioNext = {
          _props.allow-when-locked = true;
          spawn-sh = [ "playerctl next" ];
        };
        XF86MonBrightnessUp = {
          _props.allow-when-locked = true;
          spawn = [ "brightnessctl" "--class=backlight" "set" "+10%" ];
        };
        XF86MonBrightnessDown = {
          _props.allow-when-locked = true;
          spawn = [ "brightnessctl" "--class=backlight" "set" "10%-" ];
        };

        "Mod+O" = {
          _props.repeat = false;
          toggle-overview = {};
        };
        "Mod+Q" = {
          _props.repeat = false;
          close-window = {};
        };

        "Mod+Left".focus-column-left = {};
        "Mod+Down".focus-window-down = {};
        "Mod+Up".focus-window-up = {};
        "Mod+Right".focus-column-right = {};
        "Mod+H".focus-column-left = {};
        "Mod+J".focus-window-down = {};
        "Mod+K".focus-window-up = {};
        "Mod+L".focus-column-right = {};

        "Mod+Shift+Left".move-column-left = {};
        "Mod+Shift+Down".move-window-down = {};
        "Mod+Shift+Up".move-window-up = {};
        "Mod+Shift+Right".move-column-right = {};
        "Mod+Shift+H".move-column-left = {};
        "Mod+Shift+J".move-window-down = {};
        "Mod+Shift+K".move-window-up = {};
        "Mod+Shift+L".move-column-right = {};

        "Mod+Home".focus-column-first = {};
        "Mod+End".focus-column-last = {};
        "Mod+Ctrl+Home".move-column-to-first = {};
        "Mod+Ctrl+End".move-column-to-last = {};

        "Mod+Page_Down".focus-workspace-down = {};
        "Mod+Page_Up".focus-workspace-up = {};
        "Mod+D".focus-workspace-down = {};
        "Mod+U".focus-workspace-up = {};
        "Mod+Shift+Page_Down".move-column-to-workspace-down = {};
        "Mod+Shift+Page_Up".move-column-to-workspace-up = {};
        "Mod+Shift+D".move-column-to-workspace-down = {};
        "Mod+Shift+U".move-column-to-workspace-up = {};

        "Mod+Ctrl+Page_Down".move-workspace-down = {};
        "Mod+Ctrl+Page_Up".move-workspace-up = {};
        "Mod+Ctrl+D".move-workspace-down = {};
        "Mod+Ctrl+U".move-workspace-up = {};

        "Mod+WheelScrollDown" = {
          _props.cooldown-ms = 150;
          focus-workspace-down = {};
        };
        "Mod+WheelScrollUp" = {
          _props.cooldown-ms = 150;
          focus-workspace-up = {};
        };
        "Mod+Ctrl+Shift+WheelScrollDown" = {
          _props.cooldown-ms = 150;
          move-column-to-workspace-down = {};
        };
        "Mod+Ctrl+Shift+WheelScrollUp" = {
          _props.cooldown-ms = 150;
          move-column-to-workspace-up = {};
        };

        "Mod+Ctrl+WheelScrollDown".focus-column-right = {};
        "Mod+Ctrl+WheelScrollUp".focus-column-left = {};
        "Mod+Shift+WheelScrollDown".move-column-right = {};
        "Mod+Shift+WheelScrollUp".move-column-left = {};

        "Mod+1".focus-workspace = 1;
        "Mod+2".focus-workspace = 2;
        "Mod+3".focus-workspace = 3;
        "Mod+4".focus-workspace = 4;
        "Mod+5".focus-workspace = 5;
        "Mod+6".focus-workspace = 6;
        "Mod+7".focus-workspace = 7;
        "Mod+8".focus-workspace = 8;
        "Mod+9".focus-workspace = 9;
        "Mod+Ctrl+1".move-column-to-workspace = 1;
        "Mod+Ctrl+2".move-column-to-workspace = 2;
        "Mod+Ctrl+3".move-column-to-workspace = 3;
        "Mod+Ctrl+4".move-column-to-workspace = 4;
        "Mod+Ctrl+5".move-column-to-workspace = 5;
        "Mod+Ctrl+6".move-column-to-workspace = 6;
        "Mod+Ctrl+7".move-column-to-workspace = 7;
        "Mod+Ctrl+8".move-column-to-workspace = 8;
        "Mod+Ctrl+9".move-column-to-workspace = 9;

        "Mod+BracketLeft".consume-or-expel-window-left = {};
        "Mod+BracketRight".consume-or-expel-window-right = {};
        "Mod+Shift+Comma".consume-window-into-column = {};
        "Mod+Shift+Period".expel-window-from-column = {};

        "Mod+Shift+R".switch-preset-column-width = {};
        "Mod+Ctrl+R".switch-preset-window-height = {};
        "Mod+Ctrl+Shift+R".reset-window-height = {};

        "Mod+F".maximize-column = {};
        "Mod+Shift+F".fullscreen-window = {};
        "Mod+Ctrl+F".maximize-window-to-edges = {};
        "Mod+Ctrl+Shift+F".expand-column-to-available-width = {};
        "Mod+C".center-column = {};
        "Mod+Ctrl+C".center-visible-columns = {};

        "Mod+Minus".set-column-width = "-10%";
        "Mod+Equal".set-column-width = "+10%";
        "Mod+Shift+Minus".set-window-height = "-10%";
        "Mod+Shift+Equal".set-window-height = "+10%";

        "Mod+V".toggle-window-floating = {};
        "Mod+Shift+V".switch-focus-between-floating-and-tiling = {};
        "Mod+W".toggle-column-tabbed-display = {};

        Print.screenshot = {};
        "Ctrl+Print".screenshot-screen = {};
        "Alt+Print".screenshot-window = {};

        "Mod+Escape" = {
          _props.allow-inhibiting = false;
          toggle-keyboard-shortcuts-inhibit = {};
        };

        "Mod+Shift+Q".quit = {};
        "Ctrl+Alt+Delete".quit = {};
        "Mod+Alt+P".power-off-monitors = {};
      };

      _children = [
        {
          output = {
            _args = [ "eDP-1" ];
            mode = "1920x1080@60.000";
            scale = 1.25;
            transform = "normal";
            position._props = { x = 0; y = 0; };
          };
        }
        { spawn-at-startup._args = [ "swaybg -i ~/Pictures/wallpaper/ddj64ow-7b05f44f-adde-46aa-b82b-6be9fd14bc65.jpg & disown" ]; }
        { spawn-at-startup._args = [ "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1" ]; }
        {
          window-rule = {
            geometry-corner-radius = 12;
            clip-to-geometry = true;
            opacity = 0.9;
            background-effect = {
              xray = true;
              blur = true;
            };
            draw-border-with-background = false;
          };
        }
        {
          layer-rule = {
            match._props.namespace = "^wallpaper$";
            place-within-backdrop = true;
          };
        }
        {
          window-rule = {
            match._props.app-id = "localsend_app";
            open-floating = true;
          };
        }
        { workspace._args = [ "default" ]; }
        { workspace._args = [ "web" ]; }
      ];
    };
  };
}