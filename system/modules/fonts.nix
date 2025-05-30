{ inputs, pkgs, ... }:
{
    fonts.packages = with pkgs; [
        nerd-fonts.commit-mono
        roboto
        roboto-mono
        paratype-pt-serif
        noto-fonts-emoji
        font-awesome
    ];
    fonts.fontconfig.defaultFonts = {
        monospace = [ "CommitMono Nerd Font Mono" ];
        sansSerif = [ "Roboto" ];
        serif = [ "Pt-Serif" ];
        emoji = [ "Noto Color Emoji" ];
    };
}
