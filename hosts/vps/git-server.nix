{ config, pkgs, ... }: {
  users.users.git = {
    isSystemUser = true;
    description = "git user";
    group = "git";
    home = "/srv/git";
    createHome = true;
    shell = "${pkgs.git}/bin/git-shell";
    openssh = config.users.users.pcache.openssh;
  };

  users.groups.git = {};
}
