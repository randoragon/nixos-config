{ pkgs, ... }: {
  boot.kernelPackages = pkgs.linuxPackages_latest;  # Nix uses LTS kernel by default; use latest
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.tmp.useTmpfs = true;
}
