{ lib, pkgs, ... }: {
  # Overwrite boot options; use Limine for secure boot
  # https://wiki.nixos.org/wiki/Limine
  boot.loader.systemd-boot.enable = lib.mkForce false;
  boot.loader.limine = {
    enable = true;
    secureBoot.enable = true;
  };

  environment.systemPackages = with pkgs; [ sbctl ];
}
