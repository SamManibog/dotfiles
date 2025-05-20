{ ... }:
{
    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";

    networking.hostName = "nixos"; # Define your hostname.
    /*
    networking.wireless.iwd = {
        enable = true;
        settings = {
            Network.EnableIPv6 = true;
            Settings.AutoConnect = true;
        };
    };
    services.connman = {
        enable = true;
        wifi.backend = "iwd";
    };
    */
    programs.nm-applet.enable = true;
    networking.networkmanager.enable = true;
    networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
}

