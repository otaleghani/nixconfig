{ config, pkgs, ... }: 
let
  wallpaper = "001.jpg";
in {
  home.file."./.config/wallpapers/" = {
    source = ./wallpapers;
    recursive = true;
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = on;
      splash = false;
      splash_offset = 2.0;
      preload = [
        "~/.config/wallpapers/${wallpaper}"
      ];

      wallpaper = [
        "~/.config/wallpapers/${wallpaper}"
      ];
    };
  };
}
