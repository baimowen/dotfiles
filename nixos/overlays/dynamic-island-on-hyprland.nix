final: prev: {
  enhaoswen.dynamic-island-on-hyprland =
    final.callPackage ../modules/programs/gui/dynamic-island-on-hyprland/package.nix {
      qtbase = final.qt6.qtbase;
      qtdeclarative = final.qt6.qtdeclarative;
      qtnetwork = final.qt6.qtnetworkauth;
    };

  lyricsmpris =
    final.rustPlatform.buildRustPackage {
      pname = "lyricsmpris";
      version = "unstable-20260406";
      src = final.fetchFromGitHub {
        owner = "BEST8OY";
        repo = "LyricsMPRIS-Rust";
        rev = "80be876948a01620d1ad8bbeffbd27096c38bbf1";
        hash = "sha256-L77QUmCjY4HZ3KLAVMaWdKM8CVokkMNJqq47/rz84YE=";
      };
      cargoHash = "sha256-FJn5JYENBvE+j3sTkfrO/wnMJ97FfJA236TWIQjSdjQ=";
      nativeBuildInputs = [ final.pkg-config ];
      buildInputs = [ final.dbus final.openssl final.libgit2 ];
    };
}