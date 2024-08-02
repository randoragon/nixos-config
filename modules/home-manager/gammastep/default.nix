{
  services.gammastep = {
    enable = true;
    provider = "manual";
    latitude = 52.408;
    longitude = 16.934;
    temperature.day = 6500;
    temperature.night = 4500;
    settings.general = {
      gamma-day = 1.0;
      gamma-night = 0.6;
    };
  };
}
