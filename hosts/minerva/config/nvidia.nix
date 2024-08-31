{ config, pkgs, inputs, ... }: {
  # nixpkgs.config.allowUnfree = true;
  # config.hardware.nvidia.open = true;

  hardware.nvidia.open = true;
  hardware.opengl = {
    enable = true;
    # driSupport = true;
    driSupport32Bit = true;
  };
  
  nixpkgs.config.nvidia.acceptLicense = true;
  hardware.nvidia = {
    modesetting.enable = true;
    # powerManagement.enable = false;
    # powerManagement.finegrained = false;
    # open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable; 
    prime = {
      sync.enable = true;
      allowExternalGpu = true;
      intelBusId = "PCI:0:2:0";
		  nvidiaBusId = "PCI:1:0:0";
    };
  };
}
