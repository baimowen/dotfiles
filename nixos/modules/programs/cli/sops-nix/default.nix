{ pkgs, inputs, username ? "nix", ... }:

{
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];


  # [sops-nix](https://saylesss88.github.io/installation/enc/sops-nix.html)
  # [sops-nix](https://getsops.io/docs/#encrypting-with-gnupg-subkeys)

  # to encrypt file:
  # sops --encrypt --in-place --pgp <key-id> secrets/db.yaml
  # - --in-place: encrypt and replace the orig file
  # - --pgp <key-id>: key-id=$(gpg --list-keys | awk 'NR==4{print $1}')
  # - --age <pub_key>: pub_key=$(grep -Po 'public\skey:\s\K.*' $HOME/.age/keys.txt)
  # test to decrypt:
  # sops -d secrets/db.yaml

  sops = {
    # This will add secrets.yml to the nix store
    # You can avoid this by adding a string to the full path instead, i.e.
    defaultSopsFile = ./.sops.yaml;

    # --- sops-nix gpg integration options ---
    # age.keyFile = null;  # use gpg
    # decryptionOrder = [ "pgp" ];  # have no tested
    # gnupg.home = "/home/nix/.gnupg";  # gpg home dir
    # gnupg.sshKeyPaths = [ ];  # required, Whether or not using an SSH key for decryption
    # --- sops-nix gpg integration options ---

    # --- sops-nix age integration options ---
    age.sshKeyPaths = [];
    # age.keyFile = "/home/nix/.age/keys.txt";
    age.keyFile = "/home/${username}/.age/keys.txt";
    # --- sops-nix age integration options ---

    # go install, need proxy
    secrets = {
      # https://saylesss88.github.io/installation/enc/sops-nix.html
      # current_password=$(sudo getent shadow nix)
      # preset_password=$(sudo cat /run/secrets-for-users/password_hash)
      # if [ "$current_password" == "$preset_password" ]; then echo "password match"; fi
      "password_hash" = {  # <-- This name is decrypt file name: /run/secrets/password_hash
        sopsFile = ./secrets/password_hash.yaml; # <-- Points to your password hash file
        key = "password_hash";  # <-- The key in the YAML file that contains the password hash
        owner = "root";
        group = "root";
        mode = "0400";
        neededForUsers = true;
      };
      # when referencing: sops.secrets.<NAME>
      "github_access_token" = {
        sopsFile = ./secrets/github_access_token.yaml;
        # path = "/run/secrets/github/decrypt.yaml";
        owner = "root";
        group = "root";
        mode = "0400";
      };
      "cachix_auth_token" = {
        sopsFile = ./secrets/cachix_auth_token.yaml;
        key = "cachix_auth_token";
        owner = "nix";
        group = "users";
        mode = "0600";
      };
      "psql_password" = {
        sopsFile = ./secrets/psql_password.yaml;
        key = "psql_password";
        owner = "postgres";
        group = "postgres";
        mode = "0400";
      };
    };
  };

  environment.systemPackages = with pkgs; [ sops age gnupg pinentry-all ];

  programs.gnupg.agent = {
    enable = true;
    # enableSSHSupport = true;
  };
}
