{ inputs, lib, config, pkgs, ... }:

{
    stylix = {
        enable = true;
        image = ../assets/sunset_mountain.png;
        autoEnable = true;
        base16Scheme = {
            base00 = "1b202a";
            base01 = "282f3d";
            base02 = "2f384a";
            base03 = "3d465e";
            base04 = "4d5772";
            base05 = "e0e9ff";
            base06 = "fff9e4";
            base07 = "ad9673";
            base08 = "93465c";
            base09 = "d39d65";
            base0A = "efc569";
            base0B = "799d6d";
            base0C = "72acb1";
            base0D = "4d6591";
            base0E = "633950";
            base0F = "8a414f";
        };

        fonts = {
            serif = {
                package = pkgs.paratype-pt-serif;
                name = "PT Serif";
            };

            sansSerif = {
                package = pkgs.roboto;
                name = "Roboto";
            };

            monospace = {
                package = pkgs.nerd-fonts.commit-mono;
                name = "Commit Mono";
            };

            emoji = {
                package = pkgs.noto-fonts-emoji;
                name = "Noto Color Emoji";
            };
        };
    };
}
