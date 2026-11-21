{ lib, config, pkgs, ... }: {
  home.packages = with pkgs; [tone3000];

  home.activation = let
    configSrc = "/home/pcache/nixos-config/modules/home-manager/tone3000/config";
    configDest = "${config.xdg.configHome}/TONE3000";
  in {
    # Symlink config to track new presets with git
    tone3000config = lib.hm.dag.entryAfter ["writeBoundary"] ''
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
