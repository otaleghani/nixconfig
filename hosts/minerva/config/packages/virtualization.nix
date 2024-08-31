{ config, pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    qemu
    docker
  ];
}
