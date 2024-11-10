# Optional virtualization (QEMU, KVM, etc.) support
# https://nixos.wiki/wiki/Virt-manager
{ pkgs, ... }: {
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  users.users.pcache.extraGroups = [ "libvirtd" ];
  environment.systemPackages = with pkgs; [
    qemu qemu_kvm
  ];
}
