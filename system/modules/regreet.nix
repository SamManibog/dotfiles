{ pkgs, ... }:

/*
let
    hyprgreetcfg = pkgs.writeText "hyprland-regreet.conf" ''
exec-once = regreet; hyprctl dispatch exit
misc {
    disable_hyprland_logo = true
    disable_splash_rendering = true
    disable_hyprland_qtutils_check = true
}
        '';
in
*/
{
    /*
    imports = [
        ./hyprland.nix
    ];

    services.greetd = {
        enable = true;
        settings = {
            default_session = {
                command = "Hyprland --config " + hyprgreetcfg;
                user = "greeter";
            };
        };
    };

    environment.systemPackages = [ pkgs.greetd.regreet ];
    */
    programs.regreet = {
        enable = true;
    };
}
