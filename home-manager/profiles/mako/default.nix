# https://mynixos.com/home-manager/options/services.mako

{ config, pkgs, ... }: {
  services.mako = {
    enable = true;
    font = "JetBrainsMono Nerd Font 10";
    width = 256;
    height = 500;
    margin = "8";
    padding = "16";
    borderSize = 0;
    borderRadius = 4;
    backgroundColor = "#${config.colorScheme.palette.subtext01}";
    borderColor = "#${config.colorScheme.palette.base}";
    textColor = "#${config.colorScheme.palette.surface02}";
    defaultTimeout = 5000;
    extraConfig = ''
      [urgency=high]
      border-color=#${config.colorScheme.palette.red}
    '';
  };
}
