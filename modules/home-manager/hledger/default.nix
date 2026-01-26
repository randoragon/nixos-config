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
  home.file.".local/bin/hledger-debt".source = ./hledger-debt;
  home.file.".local/bin/hledger-for".source = ./hledger-for;
  home.file.".local/bin/hledger-inv".source = ./hledger-inv;

  home.sessionVariables = {
    LEDGER_FILE = "${config.xdg.dataHome}/ledger/secrets/main.journal";
  };
}
