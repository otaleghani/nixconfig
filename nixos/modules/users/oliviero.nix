{ config, pkgs, inputs, ... }: {
  users.users.oliviero = {
    isNormalUser = true;
    description = "Oliviero";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ ];
  };

  services.getty.autologinUser = "oliviero";
}
