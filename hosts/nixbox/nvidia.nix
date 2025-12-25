# Configure NVIDIA https://nixos.wiki/wiki/Nvidia
{ config, lib, pkgs, ... }: {
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;  # GTX 1060 is not supported
    nvidiaSettings = true;
    # https://nixos.wiki/wiki/Nvidia#Running_Specific_NVIDIA_Driver_Versions
    package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
      version = "580.119.02";
      sha256_64bit = "sha256-gCD139PuiK7no4mQ0MPSr+VHUemhcLqerdfqZwE47Nc=";
      sha256_aarch64 = "sha256-gCD139PuiK7no4mQ0MPSr+VHUemhcLqerdfqZwE47Nc=";
      openSha256 = "sha256-sI/ly6gNaUw0QZFWWkMbrkSstzf0hvcdSaogTUoTecI=";
      settingsSha256 = "sha256-sI/ly6gNaUw0QZFWWkMbrkSstzf0hvcdSaogTUoTecI=";
      persistencedSha256 = lib.fakeSha256;
    };
  };
}
