{ pkgs, ... }: {
  home.packages = with pkgs; [ krita ];

  xdg.configFile."krita/kritashortcutsrc" = {
    source = ./kritashortcutsrc;
  };
}
