{ config, pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    nixfmt
    neovim
    wget
    curl
    kitty
    git
    tmux
    fzf
    jq
    bc
    unzip
    httpie
    aspell
    aspellDicts.en
    gnumake
    networkmanager
    htop
    brightnessctl
    nfs-utils
    cifs-utils
    rpcbind
    lshw
    # tldr
    # bat
    # eza

    # File managers
    ranger
    cinnamon.nemo

    # Players / Viewers
    ncmpcpp
    mpc-cli
    mpd
    mpv
    vlc
    imv

    # Browsers
    firefox

    # Databases
    sqlite
  ];
}
