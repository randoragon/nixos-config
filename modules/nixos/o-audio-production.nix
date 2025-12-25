# Optional audio production support
{
  # https://github.com/musnix/musnix?tab=readme-ov-file#base-options
  musnix = {
    enable = true;
    rtcqs.enable = true;
  };

  # https://nixos.wiki/wiki/PipeWire#Low-latency_setup
  services.pipewire.extraConfig.pipewire."92-low-latency" = {
    "context.properties" = {
      "default.clock.rate" = 48000;
      "default.clock.quantum" = 256;
      "default.clock.min-quantum" = 256;
      "default.clock.max-quantum" = 2048;
    };
  };
}
