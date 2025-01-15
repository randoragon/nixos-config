{ pkgs, config, ... }: {
  home.packages = with pkgs; [
    hledger
    hledger-ui
    hledger-web
  ];

  home.file.".local/bin/hle".source = ./hle;
  home.file.".local/bin/hledger-bsee".source = ./hledger-bsee;

  home.sessionVariables = {
    LEDGER_FILE = "${config.xdg.dataHome}/ledger/secrets/main.journal";
  };
}
