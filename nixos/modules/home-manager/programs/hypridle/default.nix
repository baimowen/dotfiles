{ pkgs, ... }:

{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "hyprlock";
        after_sleep_cmd = "wlr-dpms on";
        inhibit_sleep = 1;
        ignore_dbus_inhibit = false;
      };
      listener = [
        {
          on-timeout = "brightnessctl -s set 10";
          on-resume = "brightnessctl -r";
          timeout = 150;
        }  # 2.5min inc desktop brightness
        {
          on-timeout = "{ pidof hyprlock || hyprlock } && wlr-dpms off";
          on-resume = "wlr-dpms on && brightnessctl -r";  # or use wlr-randr: wlr-randr | awk '/^[[:alnum:]-]+ / {print $1; exit}' | xargs -I {} wlr-randr --output {} --off
          timeout = 180;
        }  # 3min lock the screen
        {
          on-timeout = "brightnessctl -sd rgb:kbd_backlight set 0 && systemctl suspend";
          on-resume = "wlr-dpms on && { brightnessctl -r; brightnessctl -rd rgb:kbd_backlight }";
          timeout = 1800;
        }  # 30min close keyboard brightness and suspend the pc
      ];
    };
  };
}