{ inputs, lib, config, pkgs, ... }:

{
    programs.bash = {
        enable = true;

        initExtra = "neofetch";
        shellAliases = {
            rebuild-sys = "sudo nixos-rebuild switch --flake ~/.dotfiles --show-trace";
            rebuild-home = "home-manager switch --flake ~/.dotfiles --show-trace";
            dotfiles = "nvim ~/.dotfiles";
        };
    };
}
