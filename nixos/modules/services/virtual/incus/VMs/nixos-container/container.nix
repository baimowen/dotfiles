{
  containers = {
    container_name = {
      config = import ./container-configuration.nix;
      ephemeral = false;  # 重启后数据丢失

      privateNetwork = true;
      hostAddress = "10.100.0.1";
      localAddress = "10.100.0.2";

      forwardPorts = [
        { hostPort = 8080; containerPort = 80; }
        { hostPort = 2222; containerPort = 22; }  # SSH
      ];

      # hostBridge = "my-bridge";

      # startCommand = [ "/run/current-system/sw/bin/bash" ];
    };
  };
}