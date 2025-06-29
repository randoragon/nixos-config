{ config, pkgs, ... }: {
  home.packages = with pkgs; [ lmms ];

  home.file.".local/bin/lmms" = {
    text = ''
      #!/bin/sh -e

      confhome="${config.xdg.configHome}/lmms"

      [ ! -d "$confhome" ] && mkdir -p "$confhome"
      ${pkgs.lmms}/bin/lmms -c "$confhome/lmmsrc.xml"
    '';
    executable = true;
  };
}
