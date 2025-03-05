{ lib, ... }: {
  # Overwrite boot options; use MBR, grub and on-disk TMPDIR
  boot.loader.systemd-boot.enable = lib.mkForce false;
  boot.loader.efi.canTouchEfiVariables = lib.mkForce false;
  boot.loader.grub = {
    enable = true;
    efiSupport = false;
    devices = [ "/dev/vda" ];
  };
  boot.tmp.useTmpfs = lib.mkForce false;
}
