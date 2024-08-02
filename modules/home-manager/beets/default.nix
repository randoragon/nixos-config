{ pkgs, ... }: {
  programs.beets = {
    enable = true;
    package = pkgs.beets-unstable;
    # settings = (builtins.readFile ./config.yaml);
  };
}
