{ pkgs, ... }: 
{
  environment.systemPackages = with pkgs; [
    nfs-utils
    cifs-utils
    rpcbind
  ];
}
