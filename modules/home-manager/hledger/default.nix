{ pkgs, config, ... }: {
  home.packages = with pkgs; [ hledger hledger-ui ];

  home.file.".local/bin/hle".source = ./hle;
}
