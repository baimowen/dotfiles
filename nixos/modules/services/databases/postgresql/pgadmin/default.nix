{ config, ... }:

{
  services.pgadmin = {
    enable = true;
    initialEmail = "postgres@localhost";
    initialPasswordFile = config.sops.secrets.psql_password.path;
    port = 5050;
  };
}