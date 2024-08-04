{ config, ... }: {
  xdg.configFile."R/Renviron" = {
    text = ''
      # User environment file for R
      R_PROFILE=''${XDG_CONFIG_HOME:-$HOME/.config}/R/Rprofile
      R_HISTFILE=''${XDG_DATA_HOME:-$HOME/.local/share}/Rhistory
      R_HISTSIZE=100
      R_BROWSER=$BROWSER
      R_PDFVIEWER=$PDF_READER
    '';
  };
}
