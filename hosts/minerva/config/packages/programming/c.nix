{ config, pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    nasm
    gdb
    gcc
    libgcc
    gcc_multi
    glibc_multi
  ];
}
