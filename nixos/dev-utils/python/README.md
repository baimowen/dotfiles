### Description

This is a NixOS Python development environment.

### Usage

First, create a folder and write into .envrc

```shell
mkdir testProject
echo -e "source ../.envrc.lib\nuse flake\nuse_project_venv"
```

Next, enter the project directory and run `direnv allow`

```shell
cd testProject
direnv allow
```

Finally, install the third-party libraries or modules you need and start developing.

```python
uv pip install <packages>
```