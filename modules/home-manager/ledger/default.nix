{ pkgs, config, ... }: {
  programs.ledger = {
    enable = true;
    package = pkgs.ledger.override { gpgmeSupport = true; };
    settings = {
      file = [ "${config.xdg.dataHome}/notes/ledger/main.ldg" ];
      strict = true;
    };
  };
}
