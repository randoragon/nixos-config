# Optional audio support
{ pkgs, ... }: {
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Needed for pactl command-line utility
  environment.systemPackages = with pkgs; [
    pulseaudio
  ];
}
