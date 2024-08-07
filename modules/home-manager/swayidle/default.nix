{ pkgs, ... }: {
  services.swayidle = {
    enable = true;

    extraArgs = [ "-w" ];
    events = [
      { event = "before-sleep"; command = "${pkgs.waylock}/bin/waylock"; }
    ];
    timeouts = [
      { timeout = 600; command = "${pkgs.waylock}/bin/waylock"; }
    ];
  };
}
