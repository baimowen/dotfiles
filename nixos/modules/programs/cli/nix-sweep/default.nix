{ inputs, lib, ... }:

{
  imports = [
    inputs.nix-sweep.nixosModules.default
  ];

  services.nix-sweep = {
    enable = true;
    keepMin = 5;
    removeOlder = "30d";
    interval = "daily";
    gc = true;
    # gcInterval = "daily";
    gcInterval = "7d";
  };
}