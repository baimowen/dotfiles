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
    mkModules = system: [
      # ({...}:{nix.settings.experimental-features = ["nix-command" "flakes"];})
      ./host/configuration.nix

      # overlays:
      # { nixpkgs.overlays = [ self.overlays.default ];}

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

      home-manager.nixosModules.home-manager {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = { inherit self inputs; };
          users.nix = {  # change your username here
            imports = [
              ./modules/home-manager/home.nix
              ./modules/programs/cli/bash
              ./modules/programs/cli/git
              ./modules/programs/cli/tmux
              ./modules/programs/cli/fzf
              ./modules/programs/cli/television
              ./modules/programs/cli/nix-search-tv
              ./modules/programs/cli/npc
            ];
          };
        };
      }
    ];
    mkSystem = system: nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit self inputs; };
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
      packages = {
        # `nix build .#full` or `nix build .#packages.x86_64-linux.full`
        full = self.nixosConfigurations.nixos.config.system.build.toplevel;
      };
    }) // {
      # build system: nix build .#nixosConfigurations.nixos.config.system.build.toplevel
      # show dependency: nix path-info -r ./result
      nixosConfigurations = {
        nixos = mkSystem "x86_64-linux";  # nixos-rebuild switch --flake .#nixos
        # aarch64_nixos = mkSystem "aarch64-linux";  # nixos-rebuild switch --flake .#aarch64_nixos
        # darwin_nixos = mkSystem "x86_64-darwin";
        # add more systems here if needed
      };
    };
}