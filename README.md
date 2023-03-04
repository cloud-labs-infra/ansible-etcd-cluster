ansible-etcd-cluster
=========

Ansible role for managing and configuring etcd cluster (**not standalone instance!**)

Requirements
------------

- ETCD binaries should be installed on the target instances
- ETCD supported version is **3.5** or higher
- `iproute2` package to collect network facts for Debian-like OS

Role Variables
--------------

Variables are divided into two types (all of them you could find in [defaults/main.yml](defaults/main.yml)):

- ETCD configuration variables (read more at [Configuration options](https://etcd.io/docs/v3.4/op-guide/configuration/)). Role uses the same names but with underscore (`_`) instead of dash (`-`) in the names and with prefix `etcd_`; 

- Role variables presented below

| Name           | Default value | Description                        |
| -------------- | ------------- | -----------------------------------|
|`etcd_user`|etcd|ETCD system user|
|`etcd_group`|etcd|ETCD system group|
|`etcd_conf_dir`|/etc/etcd|Directory to store configuration and certificates (if defined)|
|`etcd_default_inventory_group`|etcd|Ansible inventory group name to get a list of hosts.<br><br>**Note:** It's required to enumerate all hosts inside cluster to set `initial-cluster` option (variable `etcd_initial_cluster`)|
|`etcd_client_port`|2379|ETCD client port|
|`etcd_peer_port`|2380|ETCD peer port|
|`etcd_bin_path`|/usr/local/bin/etcd|Binary path.<br><br>**Note:** the role doesn't supply ETCD binaries, use another role to install them and set appropriate binaries path|
|`etcd_client_protocol`|See [defaults/main.yml](defaults/main.yml)|Client protocol to connect to ETCD.<br><br>**Note:** whether http or https; defaults uses jinja logic to set appropriate protocol depending on certificate paths defined|
|`etcd_peer_protocol`|See [defaults/main.yml](defaults/main.yml)|Peer protocol to connect to ETCD.<br><br>**Note:** whether http or https; defaults uses jinja logic to set appropriate protocol depending on certificate paths defined|
|`etcd_remote_cert_files`|[]|A list of full path to certificate files on the remote host.<br><br>**Note:** role takes certificate files paths as input and moves them to configuration directory defined in variable `etcd_conf_dir`. This is required because all files should be owned by ETCD user and group. But at the stage of certificates creations system doesn't have appropriate user and group.|

Dependencies
------------

You may use any Ansible role to install ETCD but we recommend you the following:

- [andrewrothstein.etcd](https://galaxy.ansible.com/andrewrothstein/etcd)

Example Playbook
----------------


```yaml
- hosts: etcd
  roles:
     - { role: andrewrothstein.etcd }
     - { role: ansible-etcd-cluster }
```

And also `requirements.yml`:

```yaml
- name: andrewrothstein.etcd

- name: ansible-etcd-cluster
  scm: git
  src: https://github.com/cloud-labs-infra/ansible-etcd-cluster.git
```

License
-------

BSD

Author Information
------------------

Cloud Labs shared roles
