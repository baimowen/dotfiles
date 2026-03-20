{
  # nix build .#default
  description = "a drv from github";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in {
    packages.${system}.default = pkgs.stdenv.mkDerivation rec {
      pname = "fastfetch";
      version = "2.54.0";

      src = pkgs.fetchFromGitHub {
        owner = "fastfetch-cli";
        repo = "fastfetch";
        rev = "2.54.0";
        # sha256 = pkgs.lib.fakeSha256;
        sha256 = "sha256-HU+OqaLuepx89lSBwOTJYS5nq8d19AhzAaUXwlpEhUc=";
      };

      nativeBuildInputs = [ pkgs.cmake pkgs.gcc pkgs.gnumake pkgs.glib pkgs.zlib ];

      buildPhase = ''
        mkdir -p build
        cd build
        cmake .. -DCMAKE_BUILD_TYPE=Release
        cmake --build . --target fastfetch
      '';

      installPhase = ''
        mkdir -p $out/bin
        cp build/fastfetch $out/bin/
      '';

      meta = with pkgs.lib; {
        description = "Like neofetch, but faster";
        license = licenses.mit;
        homepage = "https://github.com/fastfetch-cli/fastfetch";
        maintainers = with maintainers; [ ];
        platforms = platforms.linux;
      };
    };
  };
}