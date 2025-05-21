{ inputs, pkgs, ... }:
{
    fonts.packages = with pkgs; [
        nerd-fonts.commit-mono
        roboto
        paratype-pt-serif
        noto-fonts-emoji
    ];
    fonts.fontconfig.defaultFonts = {
        monospace = [ "CommitMono Nerd Font Mono" ];
        sansSerif = [ "Roboto" "CommitMono NerdFont" ];
        serif = [ "Pt-Serif" "CommitMono NerdFont" ];
        emoji = [ "Noto Color Emoji" ];
    };
}
