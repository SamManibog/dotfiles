{ config, pkgs, ... }:
{
    imports = [
        ./wayland.nix
        ./pipewire.nix
        ./dbus.nix
    ];

    services.displayManager.defaultSession = "niri";
    programs.niri.enable = true;

}
