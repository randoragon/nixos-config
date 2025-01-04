{ config, lib, pkgs, ... }: {
  home.packages = with pkgs; [ ardour ];

  # Symlink Ardour configuration.
  # Use activation, because we want the config file to be writeable.
  home.activation = let
    configSrc = "$HOME/nixos-config/modules/home-manager/ardour";
    configDest = "${config.xdg.configHome}/ardour8";
  in {
    ardourInitialConfig = lib.hm.dag.entryAfter ["writeBoundary"] ''
      run sh -c '
        mkdir -p -- "${configDest}"
        ln -sf -- "${configSrc}/config" "${configDest}/config"
        ln -sf -- "${configSrc}/ardour.keys" "${configDest}/ardour.keys"
        ln -sf -- "${configSrc}/ui_config" "${configDest}/ui_config"
        ln -sf -- "${configSrc}/my-xcolors-ardour-8.8.colors" "${configDest}/my-xcolors-ardour-8.8.colors"
      '
    '';
  };
}
