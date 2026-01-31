# Optional virtualization (QEMU, KVM, etc.) support
# https://nixos.wiki/wiki/Virt-manager
{ pkgs, ... }: {
  # Enable QEMU and Virt Manager
  virtualisation.libvirtd = {
    enable = true;
    qemu.swtpm.enable = true;  # Windows 11 requires TPM 2.0
  };
  programs.virt-manager.enable = true;
  environment.systemPackages = with pkgs; [
    qemu qemu_kvm
    virtiofsd
  ];
  users.extraGroups.libvirtd.members = ["pcache"];
}
