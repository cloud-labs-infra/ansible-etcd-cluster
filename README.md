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

Variables are divided into two types (all of them you could find in [defaults/main.yml](defaults/main.yml).):
- role variables
  
  There is only one variable to be commented - `etcd_default_inventory_group`. Use it to set etcd cluster group name from your inventory. It's required to enumerate all hosts inside cluster to set `initial-cluster` option (variable `etcd_initial_cluster`)
  
- etcd configuration variables - read [Configuration options](https://etcd.io/docs/v3.4/op-guide/configuration/) 

Dependencies
------------

You may use any Ansible role to install ETCD but we recommend you the following:

- [andrewrothstein.etcd](https://galaxy.ansible.com/andrewrothstein/etcd)

Example Playbook
----------------

You can also find role usage examples in converge playbooks from `molecule/` direcotry. Here is another example:

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
