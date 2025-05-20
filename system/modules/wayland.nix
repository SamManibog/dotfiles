{ config, pkgs, ... }:
{
    imports = [ 
        ./pipewire.nix
        ./dbus.nix
    ];

    environment.systemPackages = with pkgs; [
        wayland
    ];

    # Configure xwayland
    services.xserver = {
        enable = true;
        xkb = {
            layout = "us";
            variant = "";
        };
    };
}
