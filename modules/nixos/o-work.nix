# Optional work stuff
{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    openconnect
    x2goclient
  ];
}
