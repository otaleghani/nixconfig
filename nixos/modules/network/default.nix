{ config, pkgs, inputs, ... }: {
  networking.hostName = "nixos";
  networking.wireless.enable = true;
  networking.networkmanager.enable = true;
  services.openssh.enable = true;

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 3000 8080 8000 ];
    allowedUDPPortRanges = [
      { from = 4000; to = 4007; }
      { from = 8000; to = 8010; }
    ];
  };

  services.rpcbind.enable = true;

  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
}
