{
  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;

    config = {
      # Disable "... is taking a while to execute" messages
      warn_timeout = 0;
    };
  };
}
