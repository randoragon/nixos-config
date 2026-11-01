{ pkgs, ... }: {
  boot.kernelPackages = pkgs.linuxPackages;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.tmp.useTmpfs = true;

  # Disable core dumps
  boot.kernel.sysctl = {
    "kernel.core_pattern" = "";
    "kernel.core_uses_pid" = 0;
  };
}
