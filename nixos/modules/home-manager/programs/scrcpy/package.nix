# ./package.nix
{ stdenv
, lib
, fetchFromGitHub
, nodejs
, pnpm
, makeWrapper
, electron
, scrcpy
, adb
, gnirehtet
, nix-update-script
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "escrcpy";
  version = "2.11.1";

  src = fetchFromGitHub {
    owner = "viarotel-org";
    repo = "escrcpy";
  };

  nativeBuildInputs = [
    nodejs
    pnpm
    makeWrapper
  ];

  buildInputs = [
    electron
  ];

  buildPhase = ''
    runHook preBuild

    # 启用 pnpm
    export HOME=$(mktemp -d)
    pnpm config set store-dir $HOME/.pnpm-store

    # 安装依赖并构建
    pnpm install --frozen-lockfile
    pnpm run build

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    # 创建应用目录
    mkdir -p $out/{bin,lib/escrcpy}

    # 复制构建产物
    cp -r dist/* $out/lib/escrcpy/

    # 创建启动脚本
    makeWrapper ${electron}/bin/electron $out/bin/escrcpy \
      --add-flags "$out/lib/escrcpy/main.js" \
      --prefix PATH : ${lib.makeBinPath [ scrcpy adb gnirehtet ]}

    runHook postInstall
  '';

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "Graphical user interface for Scrcpy based on Electron";
    longDescription = ''
      Escrcpy is an Electron-based graphical user interface for Scrcpy,
      designed to facilitate the display and control of Android devices.
    '';
    homepage = "https://github.com/viarotel-org/escrcpy";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ baimowen ];
    platforms = lib.platforms.linux;
    mainProgram = "escrcpy";
  };
})