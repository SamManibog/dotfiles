{ config, pkgs, lib, ... }:

let
    colors = config.lib.stylix.colors;
in
{
    imports = [
        ./wofi.nix
        ./waybar.nix
        ./hyprlock.nix
        ./hypridle.nix
    ];

    home.packages = with pkgs; [
        swayosd
        hyprpaper
        hyprshot
    ];

    home.pointerCursor = {
        name = "phinger-cursors-dark";
        package = pkgs.phinger-cursors;
        size = 24;
        gtk.enable = true;
    };

    services.cliphist.enable = true;
    services.swayosd.enable = true;

    wayland.windowManager.hyprland = {
        enable = true;
        xwayland.enable = true;

        settings = {
            # Variables
            "$terminal" = "kitty";
            "$fileManager" = "nautilus --new-window";
            "$menu" = "pkill wofi; wofi --show drun -i -b -n -a";
            "$mainMod" = "SUPER";

            monitor = ",preferred,auto,auto";

            exec-once = [
                "hyprpaper"
                "waybar"
            ];

            env = [
                "XCURSOR_SIZE, 24"
                "XCURSOR_THEME, phinger-cursors-dark"

                "HYPRCURSOR_SIZE, 24"
                "HYPRCURSOR_THEME, phinger-cursors-dark"
            ];

            general = {
                gaps_in = 2;
                gaps_out = 4;
                border_size = 2;
                "col.active_border" = lib.mkForce "rgb(${colors.base0C})";
                "col.inactive_border" = lib.mkForce "rgb(${colors.base02})";
                resize_on_border = false;
                allow_tearing = false;
                layout = "dwindle";
                no_focus_fallback = true;
            };

            decoration = {
                rounding = 0;
                active_opacity = 1.0;
                inactive_opacity = 0.8;

                shadow  = {
                    enabled = true;
                    range = 4;
                    render_power = 3;
                };

                blur = {
                    enabled = true;
                    size = 3;
                    passes = 1;
                    vibrancy = 0.1696;
                };
            };

            windowrule = [
                "pin, class:(.blueman-manager-wrapped|nm-connection-editor|wofi)"
                "float, class:(.blueman-manager-wrapped|nm-connection-editor|wofi)"
            ];

            animations = {
                enabled = true;
                first_launch_animation = false;

                bezier = [
                    "easeOutQuint,0.23,1,0.32,1"
                    "easeInOutCubic,0.65,0.05,0.36,1"
                    "linear,0,0,1,1"
                    "almostLinear,0.5,0.5,0.75,1.0"
                    "quick,0.15,0,0.1,1"
                ];

                animation = [
                    "global, 1, 10, default"
                    "border, 1, 5.39, easeOutQuint"
                    "windows, 1, 4.79, easeOutQuint"
                    "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
                    "windowsOut, 1, 1.49, linear, popin 87%"
                    "fadeIn, 1, 1.73, almostLinear"
                    "fadeOut, 1, 1.46, almostLinear"
                    "fade, 1, 3.03, quick"
                    "layers, 1, 3.81, easeOutQuint"
                    "layersIn, 1, 4, easeOutQuint, fade"
                    "layersOut, 1, 1.5, linear, fade"
                    "fadeLayersIn, 1, 1.79, almostLinear"
                    "fadeLayersOut, 1, 1.39, almostLinear"
                    "workspaces, 1, 1.94, almostLinear, fade"
                    "workspacesIn, 1, 1.21, almostLinear, fade"
                    "workspacesOut, 1, 1.94, almostLinear, fade"
                ];
            };

            dwindle = {
                pseudotile = true;
                preserve_split = true;
            };

            master = {
                new_status = "master";
            };

            misc = {
                force_default_wallpaper = 0;
                disable_hyprland_logo = true;
                disable_splash_rendering = true;
                background_color = lib.mkForce "rgb(000000)";
            };

            input = {
                kb_layout = "us";
                kb_variant = "";
                kb_model = "";
                kb_options = "";
                kb_rules = "";

                follow_mouse = 1;

                sensitivity = 0; # -1.0 - 1.0, 0 means no modification.

                touchpad = {
                    natural_scroll = true;
                    scroll_factor = 1.0;
                };
            };

            gestures = {
                workspace_swipe = false;
            };
            
            bind = [
                "$mainMod Control, R, exec, pkill waybar; waybar"

                "$mainMod, Return, exec, $terminal"
                "$mainMod, I, exec, firefox"
                "$mainMod, Q, killactive,"
                "$mainMod Shift Control, Q, forcekillactive,"
                "$mainMod, E, exec, $fileManager"
                "$mainMod, F, Fullscreen,"
                "$mainMod, R, exec, $menu"
                "$mainMod, V, togglesplit, # dwindle"
                "$mainMod Shift, V, togglefloating,"

                # Screenshoting 
                ", PRINT, exec, hyprshot -m output"
                "Shift, PRINT, exec, hyprshot -m window -m active"
                "Control, PRINT, exec, hyprshot -m region"

                # Move focus with mainMod + h, j, k, l
                "$mainMod, h, movefocus, l"
                "$mainMod, j, movefocus, d"
                "$mainMod, k, movefocus, u"
                "$mainMod, l, movefocus, r"

                # Move window with mainMod control + h, j, k, l
                "$mainMod Control, h, movewindow, l"
                "$mainMod Control, j, movewindow, d"
                "$mainMod Control, k, movewindow, u"
                "$mainMod Control, l, movewindow, r"

                # Switch workspaces with mainMod + [1-9]
                "$mainMod, 1, workspace, 1"
                "$mainMod, 2, workspace, 2"
                "$mainMod, 3, workspace, 3"
                "$mainMod, 4, workspace, 4"
                "$mainMod, 5, workspace, 5"
                "$mainMod, 6, workspace, 6"
                "$mainMod, 7, workspace, 7"
                "$mainMod, 8, workspace, 8"
                "$mainMod, 9, workspace, 9"

                # Move active window to a workspace with mainMod + SHIFT + [1-9]
                "$mainMod SHIFT, 1, movetoworkspace, 1"
                "$mainMod SHIFT, 2, movetoworkspace, 2"
                "$mainMod SHIFT, 3, movetoworkspace, 3"
                "$mainMod SHIFT, 4, movetoworkspace, 4"
                "$mainMod SHIFT, 5, movetoworkspace, 5"
                "$mainMod SHIFT, 6, movetoworkspace, 6"
                "$mainMod SHIFT, 7, movetoworkspace, 7"
                "$mainMod SHIFT, 8, movetoworkspace, 8"
                "$mainMod SHIFT, 9, movetoworkspace, 9"

                # Scroll through existing workspaces with mainMod + scroll
                "$mainMod, mouse_down, workspace, e+1"
                "$mainMod, mouse_up, workspace, e-1"
            ];

            binde = [
                # Resize window with mainMod shift + h, j, k, l
                "$mainMod Shift, h, resizeactive, -30 0"
                "$mainMod Shift, j, resizeactive, 0 30"
                "$mainMod Shift, k, resizeactive, 0 -30"
                "$mainMod Shift, l, resizeactive, 30 0"
            ];

            bindm = [
                # Move window with mainMod and dragging
                "$mainMod, mouse:272, movewindow"

                # Resize window with mainMod Shift and dragging
                "$mainMod + Shift, mouse:272, resizewindow"
            ];

            bindel = [
                # Output volume
                ",XF86AudioRaiseVolume, exec, swayosd-client --output-volume raise"
                ",XF86AudioLowerVolume, exec, swayosd-client --output-volume lower"
                ",XF86AudioMute, exec, swayosd-client --output-volume mute-toggle"

                # Brightness
                ",XF86MonBrightnessUp, exec, swayosd-client --brightness raise"
                ",XF86MonBrightnessDown, exec, swayosd-client --brightness lower"

                # Input volume
                "Alt, XF86AudioRaiseVolume, exec, swayosd-client --input-volume raise"
                "Alt, XF86AudioLowerVolume, exec, swayosd-client --input-volume lower"
                "Alt, XF86AudioMute, exec, swayosd-client --input-volume mute-toggle"
                ",XF86AudioMicMute, exec, swayosd-client --input-volume mute-toggle"
            ];

            bindl = [
                # Music controls (requires playerctl)
                ", XF86AudioNext, exec, playerctl next"
                ", XF86AudioPause, exec, playerctl play-pause"
                ", XF86AudioPlay, exec, playerctl play-pause"
                ", XF86AudioPrev, exec, playerctl previous"

                # Logout-like binds
                "$mainMod Alt, Q, exec, shutdown now"
                "$mainMod Alt, S, exec, systemctl suspend"
                "$mainMod Alt, R, exec, reboot"
                "$mainMod Alt, U, exec, hyprctl dispatch exit"
                "$mainMod Alt, L, exec, hyprlock --immediate"
            ];

        };
    };
}
