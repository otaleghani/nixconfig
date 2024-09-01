{ pkgs, ... }: 
{
  environment.systemPackages = with pkgs; [
    neovim
    wget
    curl
    git
    tmux
    fzf
    bc
    unzip
    kitty
    htop
    networkmanager
    brightnessctl
    lshw
    aspell
    aspellDicts.en
    nnn
  ];
}
