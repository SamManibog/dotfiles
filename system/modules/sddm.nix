{ config, pkgs, ... }:
{
    systemd.services."getty@".enable = false;
    services.displayManager.sddm = {
        enable = true;
        wayland.enable = true;
        enableHidpi = true;
    };
}
