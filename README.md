Role Name
=========

Ansible role for managing and configuring etcd cluster (**not standalone instance!**)

Requirements
------------

ETCD binaries should be installed on the target instances

Role Variables
--------------

Variables are divided into two types (all of them you could find in [defaults/main.yml](defaults/main.yml).):
- role variables
  
  There is only one variable to be commented - `etcd_default_inventory_group`. Use it to set etcd cluster group name from your inventory. It's required to enumerate all hosts inside cluster to set `initial-cluster` option (variable `etcd_initial_cluster`)
  
- etcd configuration variables - read [Configuration options](https://etcd.io/docs/v3.4/op-guide/configuration/) 

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

You may use any Ansible role to install ETCD. I recommend using `andrewrothstein.etcd` role

```yaml
- hosts: etcd
  roles:
     - { role: andrewrothstein.etcd }
     - { role: cloud_labs.etcd_cluster }
```

License
-------

BSD

Author Information
------------------

Cloud Labs shared roles
