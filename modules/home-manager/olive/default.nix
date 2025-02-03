{ pkgs, ... }: {
  home.packages = with pkgs; [ appimage-run ];

  home.file.".local/bin/olive" = {
    source = ./olive;
    executable = true;
  };
}
