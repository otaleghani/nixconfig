{ config, pkgs, ... }: {
  programs = {
    bash = {
      initExtra = ''
        if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
           exec  Hyprland
        fi
      '';
    };
    fish = {
      loginShellInit = ''
        set TTY1 (tty)
        [ "$TTY1" = "/dev/tty1" ] && exec Hyprland
      '';
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;

    settings = [
      "monitor" = "HDMI-A-1, 1920x1080, 0x0, 1";
      "monitor" = "eDP-1, 1920x1080, 1920x0, 1";

      "$mod" = "SUPER";

      "$magenta"    = "rgb(${config.colorScheme.palette.magenta})";
      "$magenta_b"  = "rgb(${config.colorScheme.palette.magenta_b})";
      "$red"        = "rgb(${config.colorScheme.palette.red})";
      "$red_b"      = "rgb(${config.colorScheme.palette.red_b})";
      "$orange"     = "rgb(${config.colorScheme.palette.orange})";
      "$orange_b"   = "rgb(${config.colorScheme.palette.orange_b})";
      "$yellow"     = "rgb(${config.colorScheme.palette.yellow})";
      "$yellow_b"   = "rgb(${config.colorScheme.palette.yellow_b})";
      "$green"      = "rgb(${config.colorScheme.palette.green})";
      "$green_b"    = "rgb(${config.colorScheme.palette.green_b})";
      "$blue"       = "rgb(${config.colorScheme.palette.blue})";
      "$blue_b"     = "rgb(${config.colorScheme.palette.blue_b})";
      "$indigo"     = "rgb(${config.colorScheme.palette.indigo})";
      "$indigo_b"   = "rgb(${config.colorScheme.palette.indigo_b})";
      "$violet"     = "rgb(${config.colorScheme.palette.violet})";
      "$violet_b"   = "rgb(${config.colorScheme.palette.violet_b})";
      "$text"       = "rgb(${config.colorScheme.palette.text})";
      "$subtext01"  = "rgb(${config.colorScheme.palette.subtext01})";
      "$subtext00"  = "rgb(${config.colorScheme.palette.subtext00})";
      "$overlay02"  = "rgb(${config.colorScheme.palette.overlay02})";
      "$overlay01"  = "rgb(${config.colorScheme.palette.overlay01})";
      "$overlay00"  = "rgb(${config.colorScheme.palette.overlay00})";
      "$surface02"  = "rgb(${config.colorScheme.palette.surface02})";
      "$surface01"  = "rgb(${config.colorScheme.palette.surface01})";
      "$surface00"  = "rgb(${config.colorScheme.palette.surface00})";
      "$base"       = "rgb(${config.colorScheme.palette.base})";
      "$mantle"     = "rgb(${config.colorScheme.palette.mantle})";
      "$crust"      = "rgb(${config.colorScheme.palette.crust})";

      input {
        "kb_layout" = "us";
        "kb_options" = "caps:escape";
        "follow_mouse" = "2";
        "float_switch_override_focus" = "2";
        "numlock_by_default" = "true";
        touchpad {
          "natural_scroll" = "yes";
        };
        "sensitivity" = "0";
      };

    ];

    # Commands after initialization
    extraCommands = [
      ""
    ];
    extraConfig = ''

    '';
  };
}
