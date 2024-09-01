{ config, pkgs, inputs, ... }: 
{
  environment.systemPackages = with pkgs; [
    waybar
    rofi-wayland
    hyprpaper
    wl-clipboard
    libnotify
    mako
    inotify-tools
    fcitx5
  ];

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  xdg.portal.config.common.default = "*";
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
}
