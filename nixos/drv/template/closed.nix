{ pkgs }:

pkgs.stdenv.mkDerivation {
  name = "my-auth-server";

  src = ./.;

  # Build-time inputs
  nativeBuildInputs = [ pkgs.nodejs ];

  # Runtime inputs
  buildInputs = [ pkgs.openssl ];

  # The build script (with Node.js and npm available)
  buildPhase = ''
    mkdir -p $out/bin
    npm run build
    cp ./dist/* $out/bin
  '';
}