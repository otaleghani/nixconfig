{ config, pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    luajit
    luajitPackages.lua-curl
    luajitPackages.nvim-nio
    luajitPackages.mimetypes
    luajitPackages.xml2lua
  ];
}
