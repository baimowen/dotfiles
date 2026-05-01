{ inputs, pkgs, lib, config, ...}:

let
  pkgs-unstable = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  # startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
  #   ${pkgs.waybar}/bin/waybar &
  # '';  # startup with hyprland
in {

  imports = [ inputs.hyprland.nixosModules.default ];

  nix.settings = {
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  # Enable graphics driver
  hardware.graphics = {
    enable = true;
    package = pkgs-unstable.mesa;
    extraPackages = with pkgs; [
      # mesa.drivers
      # mesa
      libvdpau-va-gl
      libva-vdpau-driver
    ];
  };

  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      maple-mono.NF-CN
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
    ];
    fontconfig.defaultFonts = {
      serif = [ "Maple Mono NF CN" ];
      sansSerif = [ "Maple Mono NF CN" ];
      monospace = [ "Maple Mono NF CN" ];
    };
  };

  environment = {
    systemPackages = with pkgs; [
      # rofi kitty thunar
    ];

    variables = {
      WLR_RENDERER = "pixman";
      LIBGL_ALWAYS_SOFTWARE = "1";
      GBM_BACKEND = "llvmpipe";
      # VDPAU_DRIVER = "va_gl";
      GALLIUM_DRIVER = "llvmpipe";
      __GLX_VENDOR_LIBRARY_NAME = "mesa";
    };
  };

  programs.hyprland = {
    enable = true;
    # set the flake package
    # package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    settings = {
      "$mod" = "SUPER";

      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
        # "WLR_RENDERER,pixman"
        # "LIBGL_ALWAYS_SOFTWARE,1"
        # "GBM_BACKEND,llvmpipe"
        # "__GLX_VENDOR_LIBRARY_NAME,mesa"
      ];

      exec-once = [
      ];
      bind = [
        "$mod, M, exit"

        "$mod, E, exec, thunar"
        "$mod, R, exec, rofi -show drun"

        # terminal  q/c or t/w
        # "$mod, Q, exec, kitty"
        "$mod, Q, exec, kitty -e vim"  # attach vim on kitty
        "$mod, C, killactive"

        # window management
        "$mod, F, togglefloating"
        "$mod+Alt, F, fullscreen, 0"
        "$mod+Shift, F, pseudo"

        "$mod, S, togglespecialworkspace, magic"
        "$mod+Shift, S, movetoworkspace, special:magic"

        # "$mod, J, togglesplit"

        "$mod, P, pin"

        # move focus
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
        
        # move window
        "$mod+Shift, left, movewindow, l"
        "$mod+Shift, right, movewindow, r"
        "$mod+Shift, up, movewindow, u"
        "$mod+Shift, down, movewindow, d"

        # switch active window
        "Alt, Tab, cyclenext"
        "Alt, Tab, bringactivetotop"

        # switch workspace
        # "$mod+Shift, Q, workspace, e+1"
        # "$mod+Shift, E, workspace, e-1"
        "$mod, mouse_down, workspace, e-1"
        "$mod, mouse_up, workspace, e+1"

        # resize/move windows  movewindow?moveactive
        "$mod, mouse:272, moveactive"
        "$mod, mouse:273, resizeactive"

        # screenshots
        ", Print, exec, grimblast copy area"
      ] ++ (
        # workspaces
        # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
        builtins.concatLists (builtins.genList (i:
          let ws = i + 1;
          in [
            "$mod, code:1${toString i}, workspace, ${toString ws}"
            "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
          ]
        ) 9)
      );
    };
    extraConfig = ''
      monitor=,1920x1080,auto,1

      general {
        gaps_in = 5
        gaps_out = 20
        gaps_workspaces = 50
        border_size = 2
        col.active_border = rgba(0DB7D4FF)
        col.inactive_border = rgba(31313600)
        resize_on_border = true
        allow_tearing = false
        no_focus_fallback = true
        snap {
          enabled = true
        }
        layout = dwindle

        # make rofi blurred
        # layerrule = blur, rofi
        # layerrule = ignorezero, rofi
      }

      decoration {
        rounding = 10
        rounding_power = 2
        active_opacity = 1.0
        inactive_opacity = 1.0
        shadow {
            enabled = true
            ignore_window = true
            range = 30
            offset = 0 2
            render_power = 4
            color = rgba(00000010)
        }
        blur {
            enabled = true
            xray = true
            special = false
            new_optimizations = true
            size = 14
            passes = 3
            brightness = 1
            noise = 0.01
            contrast = 1
            popups = true
            popups_ignorealpha = 0.6
            input_methods = true
            input_methods_ignorealpha = 0.8
        }
        dim_inactive = true
        dim_strength = 0.025
        dim_special = 0.07
      }

      animations {
        enabled=1
        # bezier=overshot,0.05,0.9,0.1,1.1
        bezier=overshot,0.13,0.99,0.29,1.1
        animation=windows,1,4,overshot,slide
        animation=border,1,10,default
        animation=fade,1,10,default
        animation=workspaces,1,6,overshot,slidevert
      }

      dwindle {
        pseudotile = true # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true # You probably want this
      }

      master {
        new_status = master
      }

      misc {
        # force_default_wallpaper = -1 # Set to 0 or 1 to disable the anime mascot wallpapers
        force_default_wallpaper = 0
        disable_hyprland_logo = false # If true disables the random hyprland logo / anime girl background. :(
      }

    '';
  };
}