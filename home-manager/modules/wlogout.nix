{ ... }:

{
    programs.wlogout = {
        enable = true;

        layout = [
            {
                label = "lock";
                action = "hyprlock --immediate";
                text = "Lock";
                keybind = "l";
            }
            {
                label = "hibernate";
                action = "systemctl hibernate";
                text = "Hibernate";
                keybind = "h";
            }
            {
                label = "logout";
                action = "hyprctl dispatch exit";
                text = "Logout";
                keybind = "e";
            }
            {
                label = "shutdown";
                action = "shutdown now";
                text = "Shutdown";
                keybind = "s";
            }
            {
                label = "suspend";
                action = "systemctl suspend";
                text = "Suspend";
                keybind = "u";
            }
            {
                label = "reboot";
                action = "reboot";
                text = "Reboot";
                keybind = "r";
            }
        ];

        style = /*css*/''
            @binding-set UnbindArrowFocus {
                unbind "Right";
                unbind "Left";
                unbind "Up";
                unbind "Down";
            }

            entry {
                -gtk-key-bindings: UnbindArrowFocus;
            }
        '';
    };
}
