{ pkgs, lib, config, username ? "nix", ... }:

let
  psql_password = config.sops.secrets.psql_password.path;
  nix_password_hash = config.sops.secrets.password_hash.path;
in
{
  services.postgresql = {
    enable = true;
    checkConfig = true;
    enableTCPIP = false;  # listen_addresses = if cfg.enableTCPIP then "*" else "localhost"
    # package = pkgs.postgresql_;
    # dataDir = "/var/lib/postgresql/VERSION";
    ensureUsers = [
      { name = "postgres"; }
      # { name = "nix"; ensureDBOwnership = true; }
      { name = username; ensureDBOwnership = true; }
    ];
    # ensureDatabases = [ "nix" ];
    ensureDatabases = [ username ];
    settings = {
      port = 5432;
      log_line_prefix = "%m [%p]";
    };
    # example:
    # sudo su - postgres && psql -U postgres -W postgres
    # psql -U postgres -h 127.0.0.1/::1 -W postgres
    authentication = lib.mkForce ''
      # TYPE  DATABASE  USER                  ADDRESS       METHOD
      local   all       postgres                            peer           # 允许同名用户连接同名数据库
      local   all       ${username}                         md5            # 允许密码验证连接
      host    all       all                   127.0.0.1/32  md5            # 允许密码验证连接
      host    all       all                   ::1/128       scram-sha-256  # 允许密码强验证连接
      # local   all       nix                                 md5            # 允许密码验证连接
      # local   all       all                                 reject         # 禁止其他本地用户连接
      # local   all       all                   all           reject         # 禁止其他所有连接
    '';
    initialScript = pkgs.writeShellScript "postgres-init.sh" ''
      set -euo pipefail
      PASSWORD=$(cat ${psql_password})
      NIX_PASSWORD_HASH=$(cat ${nix_password_hash})
      psql <<EOF
      ALTER USER postgres WITH PASSWORD '$PASSWORD';
      ALTER USER ${username} WITH PASSWORD '$NIX_PASSWORD_HASH';
      EOF
    '';
  };
  # openssl passwd -salt $(echo postgres|base64) -6 postgres
  users.users.postgres.hashedPassword = "$6$cG9zdGdyZXMK$qIUIuWbWM6M1DSpc3S4Y0O.cDv.xK21Igr8523qaiBSJFmCaJhnE9/RRldy17BIAnAtyzc.Y.LNj3Ox9GXj.Q1";
}