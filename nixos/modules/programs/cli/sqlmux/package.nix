{ lib
, buildGoModule
, fetchFromGitHub
}:

buildGoModule rec {
  pname = "sqlmux";
  version = "0.7.0";

  src = fetchFromGitHub {
    owner = "kackerx";
    repo = "sqlmux";
    rev = "dbfed2baa8d83be5c52cbefb2a08a5bf830a0213";
    hash = "sha256-VTAMJxKVl+Fj3NOtrPDPHo5AXbbdI28qlqTgDHukpQ8=";
  };

  subPackages = [ "cmd/sqlmux" ];

  vendorHash = "sha256-myRwEdvsGiwz/RtcRXAFdbkYAzZ1Egi9pwJYRsyfn8g=";

  meta = with lib; {
    description = "A tmux-style terminal database client with Vim keybindings";
    homepage = "https://github.com/kackerx/sqlmux";
    license = licenses.mit;
    maintainers = [ ];
    mainProgram = "sqlmux";
    platforms = platforms.unix;
  };
}