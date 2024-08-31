{ pkgs, ... }: {
  home.packages = with pkgs; [ lmms ];

  home.file.".local/bin/lmms" = {
    source = ./lmms;
    executable = true;
  };
}
