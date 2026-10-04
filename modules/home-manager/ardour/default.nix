{ config, lib, pkgs, ... }: {
  home.packages = with pkgs; [ ardour ];

  # Symlink Ardour configuration.
  # Use activation, because we want the config files to be writeable.
  home.activation = let
    configSrc = "$HOME/nixos-config/modules/home-manager/ardour/config";
    configDest = "${config.xdg.configHome}/${pkgs.ardour.meta.mainProgram}";
  in {
    ardourInitialConfig = lib.hm.dag.entryAfter ["writeBoundary"] ''
      run sh -c '
        mkdir -p -- "${configDest}/.."
        if [ -e "${configDest}" ] && [ ! -L "${configDest}" ]; then
            mv -- "${configDest}" "${configDest}.orig"
        fi
        ln -sfT -- "${configSrc}" "${configDest}"
      '
    '';
  };
}
