{
  # nix develop
  description = "A Nix-flake based Python development environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs, ... } @ inputs: 
  let 
    supportedSystems = [ 
      "x86_64-linux" 
      "aarch64-linux" 
    ];
    forEachSystem = nixpkgs.lib.genAttrs supportedSystems;
  in
  {
    devShells = forEachSystem (system: 
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        default = pkgs.mkShellNoCC {
          packages = with pkgs; [
            python311
            python311Packages.pip
            uv
          ];

        shellHook = ''
          echo "python devShell ready!"
        '';
        };
      }
    );
  };
}

# 更简单的版本
#   outputs = { self, nixpkgs, ... }: 
#   let
#     system = "x86_64-linux";
#     pkgs = import nixpkgs { inherit system; };
#   in {
#     devShells.${system}.default = pkgs.mkShell {
#       packages = with pkgs; [
#         python311
#         python311Packages.pip
#         uv
#       ];

#       shellHook = ''
#         echo "🐍 Python devShell ready!"
#       '';
#     };
#   };
# }