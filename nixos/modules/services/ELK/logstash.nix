{ pkgs, config, lib, ... }:

{
  services.logstash = {
    enable = true;
    listenAddress = "127.0.0.1";
    port = "9292";
    # logLevel = "warn";
    # inputConfig = ''
    #   # Read from journal
    #   pipe {
    #     command => "${config.systemd.package}/bin/journalctl -f -o json"
    #     type => "syslog" codec => json {}
    #   }
    # '';
    # filterConfig = ''
    # '';
    # outputConfig = ''
    #   stdout { codec => rubydebug }
    # '';
  };

  environment.systemPackages = with pkgs; [ logstash ];
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "logstash"
  ];
}