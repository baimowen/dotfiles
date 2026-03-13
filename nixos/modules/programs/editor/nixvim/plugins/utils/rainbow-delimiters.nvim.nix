{ pkgs, ... }:
{
  programs.nixvim.plugins.rainbow-delimiters = {
    enable = true;
    autoLoad = true;
    settings = {
      highlight = [
        "RainbowDelimiterRed"
        "RainbowDelimiterYellow"
        "RainbowDelimiterBlue"
        "RainbowDelimiterOrange"
        "RainbowDelimiterGreen"
        "RainbowDelimiterViolet"
        "RainbowDelimiterCyan"
      ];
    };
    strategy = {
      # 默认策略
      "" = "global";
      # 针对特定文件类型的策略
      # noop 禁用
      # global 全局 （基于整个文件的嵌套级别着色）
      # local 本地（基于当前可见区域的嵌套级别着色）
      nix = "global";
    };
  };
}