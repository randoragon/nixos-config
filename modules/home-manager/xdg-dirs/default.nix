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
      ASSETS = "${home}/Assets";
      SYNC = "${home}/Sync";
      SOFTWARE = "${home}/Software";
      PRODUCTION = "${home}/Production";
    };
  };
}
