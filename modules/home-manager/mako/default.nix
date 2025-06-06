{ pkgs, ... }: {
  home.packages = with pkgs; [ libnotify ];

  services.mako = {
    enable = true;
    settings = {
      layer = "overlay";
      max-history = 100;
      max-visible = 5;

      margin = 3;
      text-alignment = "center";
      border-size = 0;
      border-radius = 4;
      default-timeout = 5000;
      background-color = "#328fbe";
      text-color = "#000000";

      "urgency=low" = {
        default-timeout = 3000;
        background-color = "#303030";
        text-color = "#aaaaaa";
      };

      "urgency=critical" = {
        border-size = 2;
        border-color = "#220000";
        default-timeout = 0;
        background-color = "#bb2222";
        text-color = "#ffffff";
      };
    };
  };
}
