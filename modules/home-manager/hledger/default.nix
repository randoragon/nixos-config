{ pkgs, config, ... }: {
  home.packages = with pkgs; [
    hledger
    hledger-ui
    hledger-web
  ];

  home.file.".local/bin/hle".source = ./hle;
}
