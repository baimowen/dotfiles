# 硬盘挂载选项

```shell
mount -t btrfs /dev/nvme0n1p3 /mnt
btrfs subvolume creare /mnt/@
umount -R /mnt
mount --mkdir -t btrfs -o subvol=@,compress=zstd:3,noatime,ssd,space_cache=v2 /dev/nvme0n1p3 /mnt
```

# 安装

## 手动安装

克隆仓库

```shell
git clone https://github.com/baimowen/dotfiles.git
cd dotfiles/
rm -f ./nixos/host/hardware-configuration.nix
```

将硬盘挂载的声明复制到 `nixos/host` 目录下

```shell
nixos-generate-config --root /mnt
cp /mnt/etc/nixos/hardware-configuration.nix ./nixos/host/
```

创建age目录并将密钥复制到该目录下

```shell
mkdir -p /root/.age
cp /path/to/your/age.key /root/.age/keys.txt
export SOPS_AGE_KEY_FILE="$HOME/.age/keys.txt"
```

进入sops临时shell并安装nixos

```shell
nix-shell -p sops
which sops
sops -d modules/programs/cli/sops-nix/secrets/password_hash.yaml  # 验证解密
nixos-install --root /mnt --flake ./nixos#nixos  # 安装
```

## 自动化

该方法仅用于我自己，若需要请自行修改 `./.ansible/roles` 下的剧本

在live环境中配置root密码以及安装python3，同时确保硬盘无分区和子卷

```shell
su -i
passwd
nix-env -iA nixos.python311
```

在安装有ansible的主机上配置ssh-key并分发

```shell
IPADDR=your_live_ipaddr
sudo echo -e "$IPADDR    live" >> /etc/hosts
ssh-keygen -t ed25519 -N "" -f $HOME/.ssh/id_ed25519 -q
ssh-copy-id root@live
```

进入 `.ansible/` 目录并执行剧本

```shell
cd .ansible/
ansible-playbook playbooks/playbook
```

---

# 开发环境：

进入dev-utils后通过 `nix develop` 即可构建开发环境并自动加载

```shell
nix develop .
direnv allow
```
