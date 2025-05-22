{ config, pkgs, ... }:
{
    imports = [
        ./wayland.nix
        ./pipewire.nix
        ./dbus.nix
    ];

    security.pam.services.login.enableGnomeKeyring = true;
    services.gnome.gnome-keyring.enable = true;

    programs.hyprland = {
        enable = true;
        xwayland.enable = true;
    };
    environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
