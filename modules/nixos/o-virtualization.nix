# Optional virtualization (QEMU, KVM, etc.) support
# https://nixos.wiki/wiki/Virt-manager
{ pkgs, ... }: {
  # Enable QEMU and Virt Manager
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  environment.systemPackages = with pkgs; [
    qemu qemu_kvm
    virtiofsd
  ];
  users.extraGroups.libvirtd.members = ["pcache"];
}
