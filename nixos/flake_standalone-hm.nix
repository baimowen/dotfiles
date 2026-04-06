{
  description = "nixosConfiguration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    devenv.url = "github:cachix/devenv";
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-search-tv.url = "github:3timeslazy/nix-search-tv";
    npc = {
      # A CLI tool to access the history of Nixpkgs channels.
      url = "github:samestep/npc";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    flake-utils,
    nixvim,
    devenv,
    sops-nix,
    nix-search-tv,
    npc,
    ...
  } @ inputs: let

    username = "nix";
    hostname = "nixos";

    # when hm is installed as a standalone:
    mkHomeModules = system: let
      # pkgs = nixpkgs.legacyPackages.${system};
      # or, if you want to use overlays in hm:
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ (import ./overlays) ];  # expose overlays only to hm
      };
    in
      home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit self inputs username hostname; };
        modules = [
          ./modules/home-manager/home.nix
          ./modules/programs/cli/bash
          ./modules/programs/cli/git
          ./modules/programs/cli/tmux

          # cli applications
          ./modules/programs/cli/fzf
          ./modules/programs/cli/television
          ./modules/programs/cli/nix-search-tv
          ./modules/programs/cli/npc

          # gui applications
          ./modules/programs/gui/dynamic-island-on-hyprland  # dynamic-island depends on quickshell and hyprland
          ./modules/programs/gui/vincinae                    # application launcher
        ];
      };

    mkModules = system: [

      # system configuration revision
      ({ self, ... }: {
        system.configurationRevision = self.rev or self.dirtyRev or null;
      })

      # system configuration:
      ./host/configuration.nix

      # uncomment the following lines to rebuild user configurations
      # along with the system using `nixos-rebuild`.
      # but, hm must be installed in standalone mode
      # (import ./modules/home-manager/home-standalone.nix {
      #   inherit pkgs inputs username hostname;
      # })

      # modules:
      ./modules/programs/cli/sops-nix
      ./modules/programs/cli/devenv
      ./modules/programs/cli/direnv
      # ./modules/programs/cli/cachix

      # editors:
      ./modules/programs/editor/vim
      ./modules/programs/editor/nixvim

      # automation:
      ./modules/programs/cli/ansible

      # virtualization:
      ./modules/services/virtual/containerd
      ./modules/services/virtual/incus
      ./modules/services/virtual/virt
      # ./modules/services/virtual/docker  # if you want to use Docker, you need to replace nftables with iptables and comment the incus imports.
      # ./modules/programs/cli/containerlab

      # databases:
      # ./modules/services/databases/postgresql
      # ./modules/services/databases/postgresql/pgadmin

      # agent:
      # ./modules/services/agent/opencode
      # ./modules/services/agent/mattermost

      # desktop
      ./desktop/hyprland
      ./desktop/niri
      ./desktop/quickshell
    ];

    mkSystem = system: nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit self inputs username hostname; };
      modules = mkModules system;
    };

  in
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};  # precomputed
      # pkgs = import nixpkgs { inherit system; config = {}; overlays = []; };  # configurable
    in
    {
      # overlays.default = import ./overlays;
      formatter = pkgs.nixpkgs-fmt;
      # devShells.default = pkgs.mkShellNoCC { };
      devShells.default = devenv.lib.mkShell {
        # CACHIX_AUTH_TOKEN = builtins.readFile config.sops.secrets.cachix_auth_token.path;
        inherit pkgs inputs;
        modules = [
          ./devenv.nix
        ];
      };
    }) // {
      # build system: nix build .#nixosConfigurations.nixos.config.system.build.toplevel
      # show dependency: nix path-info -r ./result
      nixosConfigurations = {  # nixos-rebuild switch --flake .#hostname
        "${hostname}" = mkSystem "x86_64-linux";
        # aarch64_nixos = mkSystem "aarch64-linux";  # nixos-rebuild switch --flake .#aarch64_nixos
        # darwin_nixos = mkSystem "x86_64-darwin";
        # add more systems here if needed
      };
      # when hm is installed as a standalone:
      homeConfigurations = {  # nix run home-manager/master -- switch --flake .#username
        "${username}" = mkHomeModules "x86_64-linux";
        # "your-username" = mkHomeModules "aarch64-linux";
      };
    };
}