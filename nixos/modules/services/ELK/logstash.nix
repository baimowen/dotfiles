{ pkgs, config, lib, ... }:

{
  services.logstash = {
    enable = true;
    listenAddress = "127.0.0.1";
    port = "9292";
    logLevel = "warn";
    extraSettings = ''
      pipeline.batch.delay: 604800
      xpack.monitoring.enabled: false
    '';
    extraJvmOptions = ''
      -Xms256m
      -Xmx512m
      -XX:+UseSerialGC
      -XX:-UsePerfData
    '';
    inputConfig = ''
      # Read from journal
      # pipe {
      #   command => "${config.systemd.package}/bin/journalctl -f -o json"
      #   type => "syslog" codec => json {}
      # }
      beats {
        hosts = > "127.0.0.1"
        port => 5044
        client_inactivity_timeout => 600
        executor_threads => 1
        event_loop_threads => 1
      }
    '';
    filterConfig = ''
      drop { }
    '';
    outputConfig = ''
      stdout { codec => rubydebug }
    '';
  };

  environment.systemPackages = with pkgs; [ logstash ];
  # nixpkgs.config.allowUnfreePredicate = pkg:
  #   builtins.elem (lib.getName pkg) [
  #     "logstash"
  #   ];
}