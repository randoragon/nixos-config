{ pkgs, config, ... }: {
  gtk = {
    enable = true;

    theme = {
      package = pkgs.kanagawa-gtk-theme;
      name = "Kanagawa-BL";
    };

    iconTheme = {
      package = pkgs.kanagawa-icon-theme;
      name = "Kanagawa-BL";
    };

    cursorTheme = {
      package = pkgs.simp1e-cursors;
      name = "Simp1e-Adw-Dark";
      size = 24;
    };

    font = {
      package = pkgs.cantarell-fonts;
      name = "Cantarell";
      size = 11;
    };

    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
    gtk3.bookmarks = [
      "file://${config.home.homeDirectory}/Assets"
      "file://${config.home.homeDirectory}/Documents"
      "file://${config.home.homeDirectory}/Pictures"
      "file://${config.home.homeDirectory}/Music"
      "file://${config.home.homeDirectory}/Videos"
      "file://${config.home.homeDirectory}/Production"
      "file://${config.home.homeDirectory}/Software"
      "file://${config.home.homeDirectory}/Downloads"
      "file://${config.home.homeDirectory}/Sync"
      "file://${config.home.homeDirectory}/.config .config"
      "file://${config.home.homeDirectory}/.local/share .local/share"
    ];
  };
}
