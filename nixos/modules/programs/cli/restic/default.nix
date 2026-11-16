{ config, pkgs, ... }:

{
  services.restic = {
    server.enable = true;
    server.listenAddress = "127.0.0.1:8001";
    server.dataDir = "/var/lib/restic";
    # accepts the format username:passhash,
    # and when extracted through sops it becomes `key: value`,
    # with value being `"username:passhash"`
    server.htpasswd-file = config.sops.secrets."restic_htpasswd".path;
    server.appendOnly = false;
    # server.extraFlags = [
    #   "--no-auth"  # On a trusted device, otherwise need to pass in a password file
    # ];
    backups = {
      "localhost" = {
        initialize = true;
        repository = "/mnt/backup/restic-repo";
        passwordFile = config.sops.secrets."restic_backup_passwd".path;
        paths = [
          "/home"
        ];
        exclude = [
          "/home/*/.cache"
          "/home/*/.local/share"
          "/home/*/.nix-defexpr"
          "/home/*/.nix-profile"
          # etc.
        ];
        # auto gc:
        # pruneOpts = [ "--keep-daily 7" ];
        # timerConfig.OnCalendar = "02:00";
        # timerConfig.Persistent = true;
      };
      # other, eg: remote host backup
      # "remote" = {
      #   initialize = true;
      #   repository = "sftp:user@remote-server:/path/to/repo";
      # };
    };
  };
  networking.firewall.allowedTCPPorts = [ 8001 ];
  environment.systemPackages = with pkgs; [ backrest restic ];
}