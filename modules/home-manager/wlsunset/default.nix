{ pkgs, ... }: {
  # Doesn't work on Wayland - https://github.com/NixOS/nixpkgs/issues/169143
  services.wlsunset.enable = false;

  home.packages = with pkgs; [ wlsunset ];

  # wlsunset cannot be configured in other ways than passing command-line arguments.
  # Thus, create a wrapper script for invoking it with the desired parameters.
  home.file.".local/bin/wlsunset" = {
    text = ''
      #!/bin/sh

      ${pkgs.wlsunset}/bin/wlsunset -l 52.4 -L 16.9
    '';
    executable = true;
  };
}
