{ pkgs, config, lib, ... }: {
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";

    history = {
      path = "${config.xdg.cacheHome}/zsh/history";
      size = 10000;
      save = 0;
    };

    plugins = [
      {
        name = "zsh-vim-mode";
        src = pkgs.fetchFromGitHub {
          owner = "softmoth";
          repo = "zsh-vim-mode";
          rev = "1f9953b7d6f2f0a8d2cb8e8977baa48278a31eab";
          sha256 = "a+6EWMRY1c1HQpNtJf5InCzU7/RphZjimLdXIXbO6cQ=";
        };
      }
    ];

    initContent = let
      zshConfigEarlyInit = lib.mkOrder 550 (builtins.readFile ./zshrc-extra-first.zsh);
      zshConfig = lib.mkOrder 1000 (builtins.readFile ./zshrc-extra-last.zsh);
    in
      lib.mkMerge [ zshConfigEarlyInit zshConfig ];

    loginExtra = builtins.readFile ./zlogin-extra.zsh;
  };

  xdg.configFile."jumprc".source = ./jumprc;
  xdg.configFile."aliasrc".source = ./aliasrc;
}
