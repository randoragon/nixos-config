{
  config = {
    # XDG Desktop Portal for PipeWire screensharing etc.
    xdg.portal = {
      enable = true;
      config.common.default = [ "wlr" ];
    };

    # Allow waylock to authenticate (https://github.com/swaywm/sway/issues/2773#issuecomment-427570877)
    security.pam.services.waylock = {
      text = "auth include login";
    };
  };
}
