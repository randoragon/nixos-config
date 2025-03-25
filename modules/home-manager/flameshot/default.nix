{ config, pkgs, ... }: {
  services.flameshot = {
    enable = true;
    package = (pkgs.flameshot.override { enableWlrSupport = true; });
    settings = {
      General = {
        disabledTrayIcon = true;
        saveLastRegion = true;
        savePath = "${config.xdg.userDirs.pictures}/Screenshots";
        showDesktopNotification = false;
        showHelp = true;
        showStartupLaunchMessage = false;
      };
    };
  };
}
