{ lib
, stdenv
, fetchFromGitHub
, cmake
, qtbase
, qtdeclarative
, qtnetwork
, libgudev
}: let
  patchPhase = ''
    # Fix missing handleAudioRefresh implementation - this is a bug in the original project
    if ! grep -q "void SysBackend::handleAudioRefresh" SysBackend.cpp; then
      cat >> SysBackend.cpp << 'EOF'
void SysBackend::handleAudioRefresh() {
    fetchCurrentVolume();
    checkDefaultAudioDevice();
}
EOF
    fi
  '';
in

stdenv.mkDerivation rec {
  pname = "dynamic-island-on-hyprland";
  version = "unstable-20260405";

  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "enhaoswen";
    repo = "Dynamic-Island-on-Hyprland";
    rev = "ce9950d0aa48af1b97dc7c414c7bccf6f7f614a0";
    # nix run nixpkgs#nix-prefetch-github -- enhaoswen Dynamic-Island-on-Hyprland
    hash = "sha256-LC61ZIjAAhxUaNC/r2NUGpTQ15DCrskehkUkObgPyFk=";
  };

  nativeBuildInputs = [
    cmake
  ];

  buildInputs = [
    qtbase
    qtdeclarative
    qtnetwork
    libgudev
  ];

  cmakeFlags = [
    "-DCMAKE_BUILD_TYPE=Release"
    "-DCMAKE_BUILD_WITH_INSTALL_RPATH=ON"
    "-DCMAKE_INSTALL_RPATH_USE_LINK_PATH=OFF"
  ];

  postPatch = patchPhase;

  buildPhase = ''
    cmake . -B build -DCMAKE_BUILD_TYPE=Release
    cmake --build . --parallel $(nproc)
  '';

  installPhase = ''
    mkdir -p $out/lib/cmake/DynamicIsland
    SO_FILES=$(find . -name "libIslandBackend.so" -o -name "libIslandBackendplugin.so" 2>/dev/null)
    echo "Found .so files: $SO_FILES"
    QMLDIR=$(find . -name "qmldir" 2>/dev/null | head -1)
    echo "Found qmldir: $QMLDIR"
    if [ -n "$SO_FILES" ] && [ -n "$QMLDIR" ]; then
      cp $SO_FILES $QMLDIR $out/lib/cmake/DynamicIsland/
    else
      echo "ERROR: Files not found"
      ls -laR . | head -20
    fi
  '';

  meta = with lib; {
    description = "Dynamic Island for Hyprland";
    homepage = "https://github.com/enhaoswen/Dynamic-Island-on-Hyprland";
    license = licenses.gpl3;
    platforms = platforms.linux;
  };
}