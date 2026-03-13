{
  description = "NixOS LXC container images";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixos-generators }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    lxcConfig = { config, pkgs, ... }: {
      system.stateVersion = "26.05";
      boot.isContainer = true;
      networking.networkmanager.enable = false;
      environment.systemPackages = with pkgs; [ vim ];
      services.openssh = {
        enable = true;
        settings = {
          PermitRootLogin = "yes";
          PasswordAuthentication = true;
        };
      };
      users.users.root.initialPassword = "root";
      security.sudo.wheelNeedsPassword = false;
    };
  in {
    nixosConfigurations.lxc-container = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        "${nixpkgs}/nixos/modules/virtualisation/lxc-container.nix"
        lxcConfig
      ];
    };
    
    packages.${system} = {
      lxc = nixos-generators.lib.${system}.nixosGenerate {
        inherit system;
        modules = [ lxcConfig ];
        format = "lxc";
      };
      
      lxc-tarball = self.nixosConfigurations.lxc-container.config.system.build.tarball;
      lxc-full = self.nixosConfigurations.lxc-container.config.system.build.lxcImage;
      default = self.packages.${system}.lxc;
    };
  };
}