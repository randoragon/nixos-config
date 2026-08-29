{ pkgs, ... }: {
  services.wlsunset = {
    enable = true;
    latitude = 52.4;
    longitude = 16.9;
  };
}
