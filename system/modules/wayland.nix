{ config, pkgs, ... }:
{
    imports = [ 
        ./pipewire.nix
        ./dbus.nix
    ];

    environment.systemPackages = with pkgs; [ wayland ];

    # Configure xwayland
    services.xserver = {
        enable = true;
        tty = null;
        xkb = {
            layout = "us";
            variant = "";
        };
        excludePackages = [ pkgs.xterm ];
    };
}
