# my-project/
# ├── flake.nix
# ├── src/
# │   ├── CMakeLists.txt
# │   └── main.cpp

{
  description = "A drv with local C++ project";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";  # or aarch-linux
      pkgs = import nixpkgs { inherit system; };
    in
    {
      packages.${system}.default = pkgs.stdenv.mkDerivation rec {
        pname = "my-app";   # 应用名称
        version = "1.0.0";  # 版本号

        # 源码路径
        src = ./src;

        # 依赖包
        nativeBuildInputs = [ pkgs.cmake pkgs.gcc pkgs.gnumake ];

        # 构建步骤
        buildPhase = ''
          mkdir -p build
          cd build
          cmake .. -DCMAKE_BUILD_TYPE=Release
          cmake --build . --target my-app
        '';

        # 安装步骤
        installPhase = ''
          mkdir -p $out/bin
          cp build/my-app $out/bin/
        '';

        # 项目元数据
        meta = with pkgs.lib; {
          description = "My C++ Application";  # 项目描述
          licensse = licenses.mit;             # 许可证
          platforms = platforms.linux;         # 支持的平台
        };
      };
    };
}