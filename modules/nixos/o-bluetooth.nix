# Optional bluetooth support
{ pkgs, ... }: {
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
    package = pkgs.bluez;
  };
}
