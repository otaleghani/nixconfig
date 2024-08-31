{ config, pkgs, inputs, ... }: {
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
    ./config/bluetooth.nix
    ./config/bootloader.nix
    ./config/cronjobs.nix
    ./config/fonts.nix
    ./config/locales.nix
    ./config/network.nix
    ./config/nvidia.nix
    ./config/sound.nix
    ./config/users.nix
    # ./config/packages/apps.nix
    ./config/packages/basics.nix
    ./config/packages/fun.nix
    ./config/packages/virtualization.nix
    ./config/packages/wayland.nix
    ./config/packages/programming/c.nix
    ./config/packages/programming/go.nix
    ./config/packages/programming/html_css.nix
    ./config/packages/programming/javascript.nix
    ./config/packages/programming/lua.nix
    ./config/packages/programming/python.nix
    ./config/packages/programming/rust.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = { "oliviero" = import ./home.nix; };
  };

  programs.fish.enable = true;

  system.stateVersion = "23.11"; 

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  xdg.portal.config.common.default = "*";
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
}
