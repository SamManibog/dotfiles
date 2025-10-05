{ config, pkgs, ... }:
{
    services.displayManager.defaultSession = "none+awesome";
    services.libinput.touchpad.naturalScrolling = true;
    services.xserver = {
        enable = true;
        windowManager.awesome = {
            enable = true;
            luaModules = with pkgs.luaPackages; [
                luarocks # is the package manager for Lua modules
                luadbi-mysql # Database abstraction layer
                awesome-wm-widgets # Community collection of widgets
            ];
        };
    };
}
