{ inputs, lib, config, pkgs, ... }:

let
    colors = config.lib.stylix.colors;
in
{
    programs.waybar = {
        enable = true;

        settings.mainBar = {
            layer = "bottom";
            modules-left = [ "battery" "cpu" "memory" "pulseaudio#out" "pulseaudio#in" ];
            modules-center = ["hyprland/workspaces"];
            modules-right =  ["idle_inhibitor" "tray" "clock"];

            battery = {
                format = "{capacity}% {icon}";
                #format = "BAT: {capacity}";
                format-icons = [ "" "" "" "" "" ];
                tooltip-format = "{time} remaining";
                interval = 10;
            };
            cpu = {
                format = "{usage}% ";
                #format = "CPU: {usage}";
                interval = 10;
            };
            memory = {
                format = "{percentage}% ";
                #format = "MEM: {percentage}";
                interval = 10;
            };

            "pulseaudio#out" = {
                on-click = "pwvucontrol";
                format = "{volume}% {icon}";
                format-bluetooth = "{volume}% {icon}";
                format-muted = "0% 󰝟";
                #format = "VOL: {volume}";
                #format-muted = "VOL: MUT";
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
                #format-source = "MIC: {volume}";
                #format-source-muted = "MIC: MUT";
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

/*-------------------------------------------------
* Waybar style
*-----------------------------------------------*/
        style = /*css*/ ''
* {
    min-height: 0px;
    min-width: 0px;
    font-family: FontAwesome, Roboto;
    font-weight: normal;
    font-size: 12px;
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
            + /*css*/'' 0.7);
}

/*-------------------------------------------------
* Center Module
*-----------------------------------------------*/

#workspaces button {
    background-color:  rgba('' 
        + colors.base01-rgb-r + ","
        + colors.base01-rgb-g + ","
        + colors.base01-rgb-b + ","
            + /*css*/'' 1.0);
    border-radius: 0px;
    padding: 0px 4px;
    font-weight: normal;
    font-size: 12px;
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
        + colors.base0D-rgb-r + ","
        + colors.base0D-rgb-g + ","
        + colors.base0D-rgb-b + ","
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

#cpu, #memory, #battery, #pulseaudio {
    padding: 0px 8px;
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
    padding: 0px 8px;
}

#idle_inhibitor {
    padding: 0px;
    padding-left: 12px;
    padding-right: 4px;
}
        '';
    };

    stylix.targets.waybar.enable = false;
}
