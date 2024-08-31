{ pkgs, ... }: {
  home.packages = with pkgs; [ minecraft ];

  home.file.".local/bin/minecraft-launcher" = {
    source = ./minecraft-launcher;
    executable = true;
  };
}
