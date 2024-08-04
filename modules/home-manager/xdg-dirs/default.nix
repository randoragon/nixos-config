{ config, ... }: {
  xdg.enable = true;

  # Create default directories
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    desktop = null;
    publicShare = null;
    templates = null;
    extraConfig = let home = config.home.homeDirectory; in {
      XDG_SYNC_DIR = "${home}/Sync";
      XDG_SOFTWARE_DIR = "${home}/Software";
      XDG_PRODUCTION_DIR = "${home}/Production";
    };
  };
}
