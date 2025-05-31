{ config, pkgs, ... }:
{
    systemd.services."getty@".enable = false;

    environment.systemPackages = [ 
        (pkgs.sddm-chili-theme.override {
            themeConfig = {
                background = config.stylix.image;
                blur = true;
                recursiveBlurLoops = 3;
                recursiveBlurRadius = 5;
            };
        })
    ];

    services.displayManager.sddm = {
        enable = true;
        wayland.enable = true;
        enableHidpi = true;
        theme = "chili";
    };
}
