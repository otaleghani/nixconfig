{ config, pkgs, inputs, ... }:
{
  imports = [
    inputs.nix-colors.homeManagerModules.default

    ../modules/colors/default.nix

    # ../../modules/home-manager/kitty.nix
    # ../../modules/home-manager/fish.nix
    # ../../modules/home-manager/hyprland/hyprland.nix
    # ../../modules/home-manager/waybar.nix
    # ../../modules/home-manager/mako.nix
    # ../../modules/home-manager/rofi.nix
    # ../../modules/home-manager/neovim/neovim.nix
    # ../../modules/home-manager/tmux.nix
  ];


  home.file = {
    # "./.config/scripts/power.sh".source = ../../modules/scripts/power.sh;
    # "./.config/scripts/power.sh".executable = true;

    # "./.config/scripts/wifi.sh".source = ../../modules/scripts/wifi.sh;
    # "./.config/scripts/wifi.sh".executable = true;

    # "./.config/scripts/bluetooth.sh".source = ../../modules/scripts/bluetooth.sh;
    # "./.config/scripts/bluetooth.sh".executable = true;

    # "./.config/scripts/cron/weather.sh".source = ../../modules/scripts/cron/weather.sh;
    # "./.config/scripts/cron/weather.sh".executable = true;

    # "./.config/scripts/cron/ansiweather.sh".source = ../../modules/scripts/cron/ansiweather.sh;
    # "./.config/scripts/cron/ansiweather.sh".executable = true;

    # "./.config/autostart/spotify-player.sh".source = ../../modules/scripts/autostart/spotify-player.sh;
    # "./.config/autostart/spotify-player.sh".executable = true;
  };

  home.username = "oliviero";
  home.homeDirectory = "/home/oliviero";
  home.stateVersion = "24.05"; 

  home.packages = [
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  home.sessionVariables = { 
    BROWSER = "firefox";
    EDITOR = "nvim"; 
    TERM = "screen";
  };

  programs.home-manager.enable = true;
}
