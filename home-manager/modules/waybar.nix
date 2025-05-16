{ inputs, lib, config, pkgs, ... }:

{
    programs.waybar = {
        enable = true;

        settings.mainBar = {
            layer = "top";
            modules-left =  ["clock" "cpu" "memory"];
            modules-center = ["hyprland/workspaces"];
            modules-right = ["pulseaudio" "tray" "battery"];
            battery = {
                format = "{capacity}% {icon}";
                format-icons = ["" "" "" "" ""];
                tooltip-format = "{time} remaining";
            };
            clock = {
                format = "{:%I:%M %b %d}";
                tooltip = false;
            };
            "hyprland/workspaces" = {
                format = "{icon}{id}{icon}";
                format-icons = {
                    default = "";
                    active = "-";
                };
            };
            persistent-workspaces = {
                "*" = 9;
            };
            pulseaudio = {
                on-click = "pwvucontrol";
                format = "{volume}% {icon}";
                format-bluetooth = "{volume}% {icon}";
                format-muted = "󰝟";
                format-icons = {
                    headphones = "";
                    headphones-muted = "󰟎";
                    phone = "";
                    phone-muted = "";
                    default = ["" ""];
                    default-muted = "󰝟";
                };
                smooth-scrolling-threshold = 0;
                scroll-step = 0.5;
                reverse-scrolling = true;
            };
            memory = {
                format = "{percentage}% ";
            };
            cpu = {
                format = "{usage}% ";
            };
            tray = {
                icon-size = 20;
                spacing = 10;
            };
        };
    };
}
