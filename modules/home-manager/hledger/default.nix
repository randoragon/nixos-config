{ pkgs, config, ... }: {
  home.packages = with pkgs; [
    hledger
    hledger-ui
    hledger-web
  ];

  home.file.".local/bin/hle".source = ./hle;
  home.file.".local/bin/hledger-bsee".source = ./hledger-bsee;
  home.file.".local/bin/hledger-pozyczki".source = ./hledger-pozyczki;
  home.file.".local/bin/hledger-bud".source = ./hledger-bud;

  home.sessionVariables = {
    LEDGER_FILE = "${config.xdg.dataHome}/ledger/secrets/main.journal";
  };
}
