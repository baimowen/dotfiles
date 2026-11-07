{ lib
, pkgs
, fetchFromGitHub
}:

# general builder, check the dedicated builder from here
# https://nixos.org/manual/nixpkgs/stable/#chap-language-support
pkgs.stdenv.mkDerivation {
  pname = "my-auth-server";
  version = "0.1.0";

  # src = ./.;
  src = fetchFromGitHub {
    owner = "owner";
    repo = "repo";
    rev = "v${version}";  # it's best to use the commit hash
    hash = lib.fakeHash;
  };

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

  meta = with lib; {
    description = "";
    homepage = "";
    license = licenses.mit;
    maintainers = [ ];
    mainProgram = "";
    platformss = platforms.unix;
  }
}