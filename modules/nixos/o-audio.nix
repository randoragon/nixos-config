# Optional audio support
{ pkgs, ... }: {
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = true;
  };
}
