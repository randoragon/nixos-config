{ config, pkgs, ... }: {
  home.packages = with pkgs; [ kanata ];
  xdg.configFile."kanata/kanata.kbd".source = ./kanata.kbd;

  # Add a systemd service (https://github.com/jtroo/kanata/discussions/130).
  # Mind that kanata is not tied to a graphical session and works in the TTY as
  # well, so it should not be started by the WM, but rather on user login.
  systemd.user.services."kanata" = {
    Install = {
      WantedBy = [ "default.target" ];
    };

    Unit = {
      Description = "Kanata keyboard remapper";
      Documentation = "https://github.com/jtroo/kanata";
    };

    Service = {
      Type = "exec";
      ExecStart = "${pkgs.kanata}/bin/kanata -n";
      Restart = "no";
    };
  };
}
