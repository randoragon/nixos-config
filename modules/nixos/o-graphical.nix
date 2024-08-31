# Optional graphical session support
{
  # River should ideally be installed at the user-level.
  # However, I encountered NVIDIA-related crashes when removing this
  # system-wide enable. I assume this does something Home Manager's enabling
  # option doesn't, which is why I'm keeping it.
  programs.river = {
    enable = true;
    extraPackages = [];  # Don't use this; decide at the user-level
  };

  # XDG Desktop Portal for PipeWire screensharing etc.
  # More precise configuration should be written at the user-level.
  # This is more of a cautionary setting, in case the system-wide option does something Home Manager can't.
  xdg.portal.enable = true;

  # Allow waylock to authenticate (https://github.com/swaywm/sway/issues/2773#issuecomment-427570877)
  security.pam.services.waylock = {
    text = "auth include login";
  };
}
