{ config, ... }: {
  home.sessionVariables = {
    BEMENU_OPTS = ''
      --scrollbar=autohide
      --counter=always
      --tb #3fbfff
      --tf #000000
      --hb #3fbfff
      --hf #000000
      --scf #ffffff
      --sb #186888
      --sf #ffffff
      --bdr #223333
    '';
  };
}
