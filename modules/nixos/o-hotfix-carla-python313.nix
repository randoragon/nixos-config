{
  # Hotfix carla not working with python313 (TODO: remove when no longer needed)
  nixpkgs.overlays = [
    (self: super: { carla = super.carla.override { python3Packages = self.python312Packages; }; })
  ];
}
