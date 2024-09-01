{ config, pkgs, inputs, ... }: {
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default

    ../../../nixos/modules/bluetooth/default.nix
    ../../../nixos/modules/bootloader/default.nix
    ../../../nixos/modules/cronjobs/default.nix
    ../../../nixos/modules/fonts/default.nix
    ../../../nixos/modules/locales/default.nix
    ../../../nixos/modules/network/default.nix
    ../../../nixos/modules/nvidia/default.nix
    ../../../nixos/modules/sound/default.nix
    ../../../nixos/modules/users/default.nix

    ../../../nixos/packages/root.nix
    ../../../nixos/packages/window_managers/wayland.nix

    ../../../nixos/packages/misc/browsers.nix
    ../../../nixos/packages/misc/media.nix
    ../../../nixos/packages/misc/nfs_share.nix
    ../../../nixos/packages/misc/streaming.nix

    ../../../nixos/packages/programming/basics.nix
    ../../../nixos/packages/programming/tools/docker.nix
    ../../../nixos/packages/programming/languages/c.nix
    ../../../nixos/packages/programming/languages/go.nix
    ../../../nixos/packages/programming/languages/lua.nix
    ../../../nixos/packages/programming/languages/nix.nix
    ../../../nixos/packages/programming/languages/python.nix
    ../../../nixos/packages/programming/languages/assembly.nix
    ../../../nixos/packages/programming/languages/javascript.nix.nix
    ../../../nixos/packages/programming/languages/rust.nix
    ../../../nixos/packages/programming/databases/sqlite.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = { "oliviero" = import ../../../home-manager/users/oliviero.nix; };
  };

  programs.fish.enable = true;

  system.stateVersion = "24.05"; 
}
