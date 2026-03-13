# questions

| 问题                 | 原因                            | 解决方法                                             |
| -------------------- | ------------------------------- | ---------------------------------------------------- |
| 容器无法获取IP       | 防火墙拦截                      | 确保 `incusbr0` 在 `trustedInterfaces` 中            |
| 容器内无法运行docker | 缺少嵌套权限                    | 设置 `incus config set <name> security.nesting true` |
| 内核模块缺失         | 部分存储驱动（如ZFS）需内核支持 | 在 `boot.supportedFilesystems` 中添加相应文件系统    |



https://wiki.nixos.org/wiki/Incus#VMs

https://linuxcontainers.org/incus/docs/main/installing/

>[!tip]
>
>  userborn rootless需手动配subuid和subgid参考https://github.com/nikstur/userbron/issues/7