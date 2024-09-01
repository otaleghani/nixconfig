{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    docker
    docker-compose
    docker-machine
    docker-slim
    dive
    hadolint
    kubectl
    lazydocker
  ];
}
