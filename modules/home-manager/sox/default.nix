{ pkgs, ... }: {
  config.home.packages = [
    (pkgs.sox.override { enableLame = true; })
  ];
}
