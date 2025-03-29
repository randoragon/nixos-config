{ pkgs, ... }: {
  home.packages = with pkgs; [xwayland-satellite];

  home.sessionVariables = {
    DISPLAY = ":0";
  };
}
