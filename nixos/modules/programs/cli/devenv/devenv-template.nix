{ pkgs, ... }:

{
  lanaguages.nix.enable = true;
  packages = [];
  scripts = {
    "example-script" = {
      description = "A example-script for devenv."
      packages = [];
      exec = ''
        echo "This is an example script. You can replace it with your own commands."
        echo "For example, you can run 'example-script' to execute this script."
      '';
    };
    # "your-script" = {};
  };
  files = {
    # more file formats: https://devenv.sh/creating-files/#supported-formats
    "README.md".text = ''
      # Devenv Template

      This is a template for a Devenv configuration. You can use this as a starting point for your own configuration.

      ## Usage

      1. Install Devenv: https://devenv.sh/getting-started/#__tabbed_3_3
      2. Initialize a new developer environment: `devenv init`
      3. Enter your shell: `devenv shell`

      ## Customization

      You can customize this template by adding your own scripts and files. For example, you can add a script to run your development server or to build your project.

      For more information on how to use Devenv, please refer to the official documentation: https://devenv.sh/docs/
    '';
    "example-yaml".yaml = {
      # This is an example YAML file. You can replace it with your own configuration files.
      # For example, you can create a docker-compose.yml file to define your development environment.
      version = '3';
      services = {
        web = {
          image = "nginx:latest";
          ports = [ "8080:80" ];
        };
      };
    };
  };
  tasks = {
    # https://devenv.sh/tasks/#entershell-entertest
    "bash:hello" = {
      exec = "echo 'hello world'";
      before = [ "devenv:enterShell" ];
    };
  };
  processes = {
    # https://devenv.sh/processes
    "database" = {
      exec = "postgres -D $PGDATA";
      ready = {
        exec = "pg_isready -q -d postgres";
        notify = true;
      };
    };
    "server" = {
      exec = "${pkgs.python}/bin/python -m http.server 8000";
      after = [ "devenv:processes:database" ];  # https://devenv.sh/processes/#dependencies
      restart = { on = "on_failure"; max = 3; };
      ready = {
        http.get = { port = 8000; path = "./server"; host = "127.0.0.1"; scheme = "http"; };
      };
      watch = {
        path = [ ./src ];
        extensions = [ "py" "yaml" ];
        ignore = [ "**.md" ]
      };
    };
    "build-binary" = {
      exec = "${pkgs.gnumake}/bin/make build";
      watch = {
        path = [ ./src ];
        extensions = [ "c" "h" ];
      };
    };
  };
  # Services are a higher-level abstraction over processes. see https://devenv.sh/services/
  services.postgres = {
    enable = true;
    package = pkgs.postgresql_15;
    initialDatabases = [{ name = "mydb"; }];
    extensions = extensions: [
      extensions.postgis
      extensions.timescaledb
    ];
    settings.shared_preload_libraries = "timescaledb";
    initialScript = "CREATE EXTENSION IF NOT EXISTS timescaledb;";
  };
  containers = {
    # https://devenv.sh/containers
    "server" = {  # you can run this container with `devenv container run server`
      name = "python-server";
      startupCommand = config.processes.server.exec;
    };
    "run-binary" = {
      copyToRoot = ./result;
      startupCommand = "/app/run-binary";
    };
  };
}