{ inputs, lib, config, pkgs, ... }:

let
    colors = config.lib.stylix.colors;
in
{
    programs.waybar = {
        enable = true;

        settings.mainBar = {
            layer = "bottom";
            modules-left = [ "group/power" "battery" "cpu" "memory" "pulseaudio#out" "pulseaudio#in" ];
            modules-center = ["hyprland/workspaces"];
            modules-right =  ["idle_inhibitor" "tray" "clock"];

            "group/power" = {
                orientation = "horizontal";
                drawer = {
                    transition-duration = "250";
                    children-class = "powerIcon";
                    transition-left-to-right = "true";
                };
                modules = [
                    "custom/shutdown"
                    "custom/reboot"
                    "custom/sleep"
                    "custom/logout"
                    "custom/lock"
                ];
            };
            "custom/shutdown" = {
                format = "";
                tooltip = false;
                on-click = "shutdown now";
            };
            "custom/reboot" = {
                format = "";
                tooltip = false;
                on-click = "reboot";
            };
            "custom/sleep" = {
                format = "󰤄";
                tooltip = false;
                on-click = "systemctl suspend";
            };
            "custom/logout" = {
                format = "󰍃";
                tooltip = false;
                on-click = "hyprctl dispatch exit";
            };
            "custom/lock" = {
                format = "󰍁";
                tooltip = false;
                on-click = "hyprlock --immediate";
            };

            battery = {
                format = "{capacity}% {icon}";
                format-icons = [ "" "" "" "" "" ];
                tooltip-format = "{time} remaining";
                interval = 10;
            };
            cpu = {
                format = "{usage}% ";
                interval = 10;
                on-click = "kitty -e btop -p 1";
            };
            memory = {
                format = "{percentage}% ";
                interval = 10;
                on-click = "kitty -e btop -p 2";
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
                    default = "";
                    default-muted = "󰝟";
                };
                scroll-step = 0;
            };
            "pulseaudio#in" = {
                on-click = "pwvucontrol";
                format = "{format_source}";
                format-source = "{volume}% 󰍬";
                format-source-muted = "0% 󰍭";
                tooltip = false;
                scroll-step = 0;
            };

            idle_inhibitor = {
                format = "{icon}";
                format-icons = {
                    activated = "󱙱";
                    deactivated = "󰌾";
                };
                tooltip-format-activated = "Lockscreen Disabled";
                tooltip-format-deactivated = "Lockscreen Enabled";
            };

            clock = {
                format = "{:%A %b %d, %Y - %I:%M:%S}";
                interval = 1;
                tooltip = false;
            };
            "hyprland/workspaces" = {
                format = "{id}";
                persistent-workspaces = {
                    "*" = 9;
                };
            };

            tray = {
                icon-size = 12;
                spacing = 4;
                reverse-direction = true;
                show-passive-items = true;
            };
        };

        style = /*css*/ ''
* {
    min-height: 0px;
    min-width: 0px;
    font-family: FontAwesome, Roboto;
    font-weight: normal;
    font-size: 12px;
}

window {
    color: rgba('' 
        + colors.base05-rgb-r + ","
        + colors.base05-rgb-g + ","
        + colors.base05-rgb-b + ","
            + /*css*/'' 1.0);
}

window#waybar {
    background-color: rgba('' 
        + colors.base00-rgb-r + ","
        + colors.base00-rgb-g + ","
        + colors.base00-rgb-b + ","
            + /*css*/'' 1.0);
}

/*-------------------------------------------------
* Center Module
*-----------------------------------------------*/

#workspaces button {
    color: rgba('' 
        + colors.base05-rgb-r + ","
        + colors.base05-rgb-g + ","
        + colors.base05-rgb-b + ","
            + /*css*/'' 1.0);
    background-color:  rgba('' 
        + colors.base02-rgb-r + ","
        + colors.base02-rgb-g + ","
        + colors.base02-rgb-b + ","
            + /*css*/'' 1.0);
    border-radius: 0px;
    padding: 0px 4px;
    font-weight: normal;
    font-size: 12px;
}

#workspaces button.empty {
    background-color:  rgba('' 
        + colors.base01-rgb-r + ","
        + colors.base01-rgb-g + ","
        + colors.base01-rgb-b + ","
            + /*css*/'' 1.0);
}

#workspaces button:nth-child(1) {
    border-top-left-radius: 100px;
    border-bottom-left-radius: 100px;
    padding-left: 7px;
}

#workspaces button:nth-last-child(1) {
    border-top-right-radius: 100px;
    border-bottom-right-radius: 100px;
    padding-right: 7px;
}

#workspaces button.active {
    background-color:  rgba('' 
        + colors.base05-rgb-r + ","
        + colors.base05-rgb-g + ","
        + colors.base05-rgb-b + ","
            + /*css*/'' 1.0);
    color:  rgba('' 
        + colors.base00-rgb-r + ","
        + colors.base00-rgb-g + ","
        + colors.base00-rgb-b + ","
            + /*css*/'' 1.0);
}

/*-------------------------------------------------
* LEFT MODULES
*-----------------------------------------------*/

.modules-left > :nth-last-child(1) > * {
    border-top-right-radius: 100px;
    border-bottom-right-radius: 100px;
}

.modules-left > * > * {
    background-color:  rgba('' 
        + colors.base01-rgb-r + ","
        + colors.base01-rgb-g + ","
        + colors.base01-rgb-b + ","
            + /*css*/'' 1.0);
}

.modules-left > :nth-child(1) { /*for power module*/
    background-color:  rgba('' 
        + colors.base01-rgb-r + ","
        + colors.base01-rgb-g + ","
        + colors.base01-rgb-b + ","
            + /*css*/'' 1.0);
}

#power {
    background-color:  rgba('' 
        + colors.base02-rgb-r + ","
        + colors.base02-rgb-g + ","
        + colors.base02-rgb-b + ","
            + /*css*/'' 1.0);
    border-top-right-radius: 100px;
    border-bottom-right-radius: 100px;
}

#custom-shutdown, #custom-reboot, #custom-sleep, #custom-logout, #custom-lock {
    padding: 0px 8px;
}

#cpu, #memory, #battery, #pulseaudio, #custom-system {
    padding: 0px 8px;
}

#battery {
    padding-right: 14px;
}

#cpu {
    padding-right: 12px;
}

#memory {
    padding-right: 14px;
}

#pulseaudio.module.out {
    padding-right: 11px;
}

#pulseaudio.module.in {
    padding-right: 9px;
}

/*-------------------------------------------------
* RIGHT MODULES
*-----------------------------------------------*/

.modules-right {
    border-top-left-radius: 100px;
    border-bottom-left-radius: 100px;
    background-color:  rgba('' 
        + colors.base01-rgb-r + ","
        + colors.base01-rgb-g + ","
        + colors.base01-rgb-b + ","
            + /*css*/'' 1.0);
    padding-right: 8px;
}

#tray {
    padding-right: 8px;
    padding-left: 3px;
}

#idle_inhibitor {
    padding: 0px;
    padding-left: 12px;
    padding-right: 6px;
}
        '';
    };

    stylix.targets.waybar.enable = false;
}
