{ pkgs, ... }: {
  home.packages = with pkgs; [vimiv-qt];

  xdg.configFile."vimiv-qt/styles/base16-grayscale-dark".source = ./base16-grayscale-dark;
  xdg.configFile."vimiv-qt/vimiv.conf".source = ./vimiv.conf;

  # Use fit scaling by default
  home.file.".local/bin/vimiv" = {
    text = ''
      #!/bin/sh -e

      ${pkgs.vimiv-qt}/bin/vimiv --command "scale --level=fit" "$@"
    '';
    executable = true;
  };
}
