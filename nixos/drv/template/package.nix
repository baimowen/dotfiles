{ lib
, pkgs
, fetchFromGitHub
}:

pkgs.stdenv.mkDerivation rec {
  pname = "template";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "owner";
    repo = "repo";
    rev = "v${version}";
    hash = lib.fakeHash;
  };

  meta = with lib; {
    description = "";
    homepage = "";
    license = licenses.mit;
    maintainers = [ ];
    mainProgram = "";
    platforms = platforms.unix;
  };
}