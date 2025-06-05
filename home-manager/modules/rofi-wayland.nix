{ pkgs, ... }:
{
    programs.rofi = {
        enable = true;
        package = pkgs.rofi-wayland;
        terminal = "kitty";
        extraConfig = {
            normal-window = true;
        };
    };
}
