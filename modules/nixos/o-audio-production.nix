# Optional audio production support
{
  # Allow programs like Ardour run by users from the "audio" group to use more memory
  # https://discourse.ardour.org/t/memory-warning-from-ardour/108064
  security.pam.loginLimits = [
    {
      domain = "@audio";
      item = "memlock";
      type = "-";
      value = "unlimited";
    }
  ];

  # Keep CPUs ready for work
  powerManagement.cpuFreqGovernor = "performance";

  # Allow members of "audio" group to access /dev/cpu_dma_latency
  services.udev = {
    extraRules = ''
        KERNEL=="rtc0", GROUP="audio"
        KERNEL=="hpet", GROUP="audio"
        DEVPATH=="/devices/virtual/misc/cpu_dma_latency", OWNER="root", GROUP="audio", MODE="0660"
    '';
  };

  # https://nixos.wiki/wiki/PipeWire#Low-latency_setup
  services.pipewire.extraConfig.pipewire."92-low-latency" = {
    "context.properties" = {
      "default.clock.rate" = 48000;
      "default.clock.quantum" = 512;
      "default.clock.min-quantum" = 256;
      "default.clock.max-quantum" = 4096;
    };
  };
}
