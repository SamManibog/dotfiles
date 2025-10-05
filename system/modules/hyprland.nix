{ config, pkgs, ... }:
{
    imports = [
        ./wayland.nix
        ./pipewire.nix
        ./dbus.nix
    ];

    security.pam.services.hyprlock = {};

    services.displayManager.defaultSession = "hyprland";

    programs.hyprland = {
        enable = true;
        xwayland.enable = true;
    };
    environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
