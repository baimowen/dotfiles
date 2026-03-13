{ pkgs, ... }:

{
  # 查看频道： tv list-channels
  # 更新频道： tv update-channels
  # 模糊搜索频道内容： tv <channel-name>
  
  programs.television.enable = true;
  programs.television.enableBashIntegration = true;

  # 模糊搜索本地文件/目录依赖： fd bat
  home.packages = with pkgs; [
    fd bat
  ];
}