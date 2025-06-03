# Config group for systems with access to my notes.
{ note, ... }: {
  imports = [
    ./note-utils
  ];

  home.packages = [ note ];
}
