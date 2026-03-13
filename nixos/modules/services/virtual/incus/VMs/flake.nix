{
  # build cmd: nix build .#nixosConfigurations.container.config.system.build.tarball
  description = "Template for Incus VMs";

  inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

  outputs = { self, nixpkgs, ... }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in
  {
    nixosConfigurations = {
      container = inputs.nixpkgs.lib.nixosSystem {
        system = system;
        modules = [
          "${nixpkgs}/nixos/modules/virtualisation/lxc-container.nix"
          (
            { pkgs, ... }:
            {
              boot.isContainer = true;
              environment.systemPackages = [ pkgs.vim ];
              services.openssh.enable = true;
            }
          )
        ];
      };

      vm = inputs.nixpkgs.lib.nixosSystem {
        system = system;
        modules = [
          "${nixpkgs}/nixos/modules/virtualisation/incus-virtual-machine.nix"
          (
            { pkgs, ... }:
            {
              environment.systemPackages = [ pkgs.vim ];
            }
          )
        ];
      };
    };
  };
}