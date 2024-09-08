# https://mynixos.com/home-manager/options/programs.fish
{ config, pkgs, ... }: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
    '';
    plugins = [{
      name = "grc";
      src = pkgs.fishPlugins.grc.src;
    }];
  };
}
