{ inputs, lib, config, pkgs, ... }:

{
    programs.bash = {
        enable = true;

        initExtra = ''
            neofetch
            alias rebuild-sys="sudo nixos-rebuild switch --flake ~/.dotfiles --show-trace"
            alias rebuild-home="home-manager switch --flake ~/.dotfiles --show-trace"
            alias dotfiles="nvim ~/.dotfiles"
        '';
    };
}
