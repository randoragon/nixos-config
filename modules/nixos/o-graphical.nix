# Optional graphical session support
{ pkgs, ... }: {
  services.libinput.enable = true;

  # XDG Desktop Portal for PipeWire screensharing etc.
  # More precise configuration should be written at the user-level.
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-wlr xdg-desktop-portal-gtk ];
    config.common.default = [
      "gtk"
      "wlr"
    ];
  };

  # Required to make some gtk features work
  programs.dconf.enable = true;

  # Allow swaylock to authenticate (https://github.com/swaywm/sway/issues/2773#issuecomment-427570877)
  security.pam.services.swaylock = {
    text = "auth include login";
  };
}
