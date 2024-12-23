{
  # Manual configuration needed:
  # 1. Run coolercontrol.
  # 2. Open UI in browser.
  # 3. Go to "Profiles & Functions".
  # 4. Edit "My Profile" and change Type to "Graph".
  # 5. Set Source to CPU Temp Package Id 0.
  # 6. Sculpt the graph to liking (e.g. 0% below 60C, then 15%-100% from 60C to 90C).
  # 7. Go to each Fan and set its profile to "My Profile".
  # 8. Done!
  programs.coolercontrol = {
    enable = true;
    nvidiaSupport = true;
  };

  boot.kernelModules = [ "coretemp" "nct6775" ];
}
