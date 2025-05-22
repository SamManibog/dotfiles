{ inputs, lib, config, pkgs, ... }:

{
    programs.waybar = {
        enable = true;

        settings.mainBar = {
            layer = "bottom";
            modules-left = ["battery" "cpu" "memory" "pulseaudio#in" "pulseaudio#out"];
            modules-center = ["hyprland/workspaces"];
            modules-right =  ["tray" "clock"];

            battery = {
                format = "{capacity}% {icon}";
                format-icons = ["" "" "" "" ""];
                tooltip-format = "{time} remaining"; };
                interval = 10;
            clock = {
                format = "{:%A %b %d, %Y - %I:%M:%S}";
                interval = 1;
                tooltip = false;
            };
            "hyprland/workspaces" = {
                format = "{icon}{id}{icon}";
                format-icons = {
                    default = "";
                    active = "-";
                };
                persistent-workspaces = {
                    "*" = 9;
                };
            };
            "pulseaudio#out" = {
                on-click = "pwvucontrol";
                format = "{volume}% {icon}";
                format-bluetooth = "{volume}% {icon}";
                format-muted = "0% 󰝟";
                format-icons = {
                    headphones = "";
                    headphones-muted = "󰟎";
                    phone = "";
                    phone-muted = "";
                    default = ["" "" ""];
                    default-muted = "󰝟";
                };
                scroll-step = 0;
            };
            "pulseaudio#in" = {
                on-click = "pwvucontrol";
                format = "{format_source}";
                format-source = "{volume}% 󰍬";
                format-source-muted = "0% 󰍭";
                scroll-step = 0;
            };
            memory = {
                format = "{percentage}% ";
                interval = 10;
            };
            cpu = {
                format = "{usage}% ";
                interval = 10;
            };
            tray = {
                icon-size = 20;
                spacing = 10;
            };
        };
    };

    stylix.targets.waybar.enable = false;
}
