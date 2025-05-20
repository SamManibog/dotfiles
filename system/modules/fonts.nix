{ pkgs, ... }:
{
    fonts.packages = with pkgs; [
        nerd-fonts.commit-mono
        roboto
        paratype-pt-serif
    ];
    fonts.fontconfig.defaultFonts = {
        monospace = [ "CommitMono Nerd Font Mono" ];
        sansSerif = [ "Roboto" "CommitMono NerdFont" ];
        serif = [ "Pt-Serif" "CommitMono NerdFont" ];
    };
}
