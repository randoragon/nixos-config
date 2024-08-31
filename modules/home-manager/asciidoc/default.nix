{ pkgs, ... }: {
  home.packages = with pkgs; [ asciidoctor ];

  home.file.".local/bin/adoctopdf" = {
    source = ./adoctopdf;
    executable = true;
  };
}
