{ lib
, buildGoModule
, fetchFromGitHub
}:

buildGoModule rec {
  pname = "datavim";
  version = "3.4.0";

  src = fetchFromGitHub {
    owner = "shepherd-yun";
    repo = "datavim";
    rev = "e4549d9b408182515be0f8bbf943432e62bfe268";
    hash = "sha256-P+nUYn/ReM8caDEcXfvgomkYphde1aMK1BK9Q47UnxA=";
  };

  subPackages = [ "cmd/datavim" ];

  vendorHash = "sha256-Iw4TVrtcMfz9DqMBc1hG4TAGD7PYNjjnQsh1JQqeoPI=";

  meta = with lib; {
    description = "Terminal client for MySQL, PostgreSQL, SQL Server, Oracle, Redis and Kafka with vim keys and DataGrip-style workflows";
    homepage = "https://github.com/shepherd-yun/datavim";
    license = licenses.mit;
    maintainers = [ ];
    mainProgram = "datavim";
    platforms = platforms.unix;
  };
}