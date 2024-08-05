{ config, ... }: {
  home.sessionVariables = {
    ICEAUTHORITY = "${config.xdg.cacheHome}/ICEauthority";
    XAUTHORITY = "\${XDG_RUNTIME_DIR:-/run/user/$UID}/Xauthority";
  };
}
