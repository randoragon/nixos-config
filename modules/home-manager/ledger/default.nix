{ pkgs, config, ... }: {
  programs.ledger = {
    enable = true;
    settings = {
      file = [ "${config.xdg.dataHome}/notes/ledger/main.ldg" ];
      strict = true;
    };
  };

  home.file.".local/bin/pled" = {
    source = ./pled;
    executable = true;
  };
}
