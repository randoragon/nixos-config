{ pkgs, config, ... }: {
  home.packages = with pkgs; [ hledger ];

  home.file.".local/bin/hle".source = ./hle;
}
