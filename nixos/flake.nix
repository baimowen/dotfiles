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
    nix-sweep.url = "github:jzbor/nix-sweep";
    catppuccin.url = "github:catppuccin/nix";
    # zen-browser.url = "github:github:0xc000022070/zen-browser-flake/8ce7d926dbec820ab5686d599bc6a1bd19ed1273";
    zen-browser.url = "github:0xc000022070/zen-browser-flake?rev=8ce7d926dbec820ab5686d599bc6a1bd19ed1273";
    # npc = {
    #   # A CLI tool to access the history of Nixpkgs channels.
    #   url = "github:samestep/npc";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    quickshell = {
      url = "github:quickshell-mirror/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # caelestia-shell = {
    #   url = "github:caelestia-dots/shell";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    dankMaterialShell = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    swww.url = "github:LGFae/swww";
    vicinae.url = "github:vicinaehq/vicinae";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
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
    nix-sweep,
    catppuccin,
    zen-browser,
    # npc,
    quickshell,
    # caelestia-shell,
    dankMaterialShell,
    swww,
    vicinae,
    spicetify-nix,
    ...
  } @ inputs: let

    # when hm is installed as a standalone:
    mkHomeModules = system: let
      pkgs = nixpkgs.legacyPackages.${system};
      # or, if you want to use overlays in hm:
      # pkgs = import nixpkgs {
      #   inherit system;
      #   overlays = [ (import ./overlays) ];  # expose overlays only to hm
      # };
    in
      home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit self inputs; };
        modules = [
          ./modules/home-manager/home.nix
          ./modules/programs/cli/bash
          ./modules/programs/cli/git
          ./modules/programs/cli/tmux

          # themes
          ./modules/home-manager/themes/catppuccin

          # cli applications
          ./modules/programs/cli/fzf
          ./modules/programs/cli/television
          ./modules/programs/cli/nix-search-tv
          ./modules/programs/cli/npc

          # desktop
          # ./desktop/caelestia-shell
          ./desktop/quickshell
          ./modules/home-manager/programs/wl-kbptr
          ./modules/home-manager/programs/lf
          ./modules/home-manager/programs/kitty
          ./modules/home-manager/programs/nm-applet     
          ./modules/home-manager/programs/blueman-applet
          ./modules/home-manager/programs/hyprpolkitagent
          ./modules/home-manager/programs/hypridle
          # ./modules/home-manager/programs/hyprlock
          ./modules/home-manager/programs/hyprlauncher  
          ./modules/home-manager/programs/vicinae
          ./modules/home-manager/programs/swww
          ./modules/home-manager/programs/swaync
          # ./modules/home-manager/programs/mako
          ./modules/home-manager/programs/mpd
          ./modules/home-manager/programs/mpv
          ./modules/home-manager/programs/bat
          ./modules/home-manager/programs/btop
          ./modules/home-manager/programs/playerctl
          ./modules/home-manager/programs/neomutt
          # ./modules/home-manager/programs/waybar
          ./modules/home-manager/programs/termfilechooser
          ./modules/home-manager/programs/translate-shell
          ./modules/home-manager/programs/obs-studio
          ./modules/home-manager/programs/kdeconnect
          # ./modules/home-manager/programs/scrcpy
          ./modules/home-manager/programs/onlyoffice
          ./modules/home-manager/programs/spicetify-nix
          ./modules/home-manager/programs/cava
          ./modules/home-manager/programs
        ];
      };

    mkModules = system: [

      # system configuration revision
      ({ self, ... }: {
        system.configurationRevision = self.rev or self.dirtyRev or null;
      })

      ({ pkgs, ... }: {
        environment.systemPackages = with pkgs; [ vim util-linux binutils pciutils inetutils ];
      })

      # system configuration:
      ./host/configuration.nix

      # uncomment the following lines to rebuild user configurations
      # along with the system using `nixos-rebuild`.
      # but, hm must be installed in standalone mode
      # (import ./modules/home-manager/home-standalone.nix {
      #   inherit pkgs inputs username hostname;
      # })

      # themes
      ./modules/programs/themes/catppuccin

      # modules:
      ./modules/programs/cli/sops-nix
      ./modules/programs/cli/devenv
      ./modules/programs/cli/direnv
      # ./modules/programs/cli/cachix
      ./modules/programs/cli/nix-sweep

      # editors:
      ./modules/programs/editor/vim
      # ./modules/programs/editor/nixvim
      ./modules/programs/editor/vscode

      # automation:
      ./modules/programs/cli/ansible

      # virtualization:
      ./modules/services/virtual/containerd
      ./modules/services/virtual/podman
      ./modules/services/virtual/virt
      # ./modules/services/virtual/incus
      # ./modules/services/virtual/docker  # if you want to use Docker, you need to replace nftables with iptables and comment the incus imports.
      # ./modules/programs/cli/containerlab

      # databases:
      ./modules/services/databases/postgresql
      # ./modules/services/databases/postgresql/pgadmin

      # log
      ./modules/services/ELK/logstash.nix

      # pane
      ./modules/services/cockpit

      # cli applications:
      ./modules/programs/cli

      ./envVars.nix
      ./desktop/gnome
      ./desktop/niri
      ./desktop/dms
      # ./modules/programs/browser/zen
      ./modules/programs/proxy
      ./modules/programs/steam
      ./modules/programs/gui/localsend
    ];

    mkSystem = system: nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { currenSystem = system; inherit self inputs; };
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
      devShells.default = pkgs.mkShellNoCC { };
      # devShells.default = devenv.lib.mkShell {
      #   # CACHIX_AUTH_TOKEN = builtins.readFile config.sops.secrets.cachix_auth_token.path;
      #   inherit pkgs inputs;
      #   modules = [
      #     ./devenv.nix
      #   ];
      # };
    }) // {
      # solutions to assertion issues: add `--no-write-lock-file` parameter to the build command
      # build system: nix build .#nixosConfigurations.nixos.config.system.build.toplevel
      # show dependency: nix path-info -r ./result
      nixosConfigurations = {  # nixos-rebuild switch --flake .#hostname
        "nixos" = mkSystem "x86_64-linux";
        # aarch64_nixos = mkSystem "aarch64-linux";  # nixos-rebuild switch --flake .#aarch64_nixos
        # darwin_nixos = mkSystem "x86_64-darwin";
        # add more systems here if needed
      };
      # when hm is installed as a standalone:
      homeConfigurations = {  # nix run home-manager/master -- switch --flake .#username
        "nix" = mkHomeModules "x86_64-linux";
        # "your-username" = mkHomeModules "aarch64-linux";
      };
    };
}