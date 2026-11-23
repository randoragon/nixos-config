{ config, lib, pkgs, ... }: {
  # Symlink dussek instruments.
  # Use activation, because we want the files to be stored in ~/Assets, and they weigh too much to
  # be stored in nixos-config. Also being able to modify them is nice.
  home.activation = let
    instrumentsSrc = "${config.xdg.userDirs.extraConfig.ASSETS}/audio/presets/dussek";
    instrumentsDest = "${config.xdg.dataHome}/dussek";
  in {
    dussekInstruments = lib.hm.dag.entryAfter ["writeBoundary"] ''
      run sh -c '
        mkdir -p -- "${instrumentsDest}/.."
        if [ -e "${instrumentsDest}" ] && [ ! -L "${instrumentsDest}" ]; then
            mv -- "${instrumentsDest}" "${instrumentsDest}.orig"
        fi
        ln -sfT -- "${instrumentsSrc}" "${instrumentsDest}"
      '
    '';
  };
}
