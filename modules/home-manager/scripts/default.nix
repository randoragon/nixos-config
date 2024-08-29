{
  imports = [
    ./spush-spull.nix
  ];

  home.file.".local/bin" = {
    source = ./localbin;
    executable = true;
    recursive = true;
  };

  home.file.".scripts" = {
    source = ./scripts;
    executable = true;
    recursive = true;
  };
}
