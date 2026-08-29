{ config, ... }: {
  services.flameshot = {
    enable = true;
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
