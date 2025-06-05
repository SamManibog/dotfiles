{ inputs, lib, config, pkgs, ... }:

{
    stylix = {
        enable = true;

        autoEnable = true;
        image = ../assets/warm_mountain.png;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-soft.yaml";

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
