{ pkgs, ... }:
{
    environment.systemPackages = [ pkgs.kitty ];
    programs.nautilus-open-any-terminal = {
        enable = true;
        terminal = "kitty";
    };

    environment.variables = {
        TERM = "kitty";
        TERMINAL = "kitty";
    };


    xdg.terminal-exec = {
        enable = true;
        settings = {
            default = [ "kitty.desktop" ];
        };
    };
}
