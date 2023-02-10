LNLS Ansible Role Users
=======================

References: https://bitbucket.org/europeanspallationsource/ics-ans-role-localusers

This Ansible role configures some defaults users/groups for Sirius Light Source control machines.

## Requirements

- ansible >= 2.9
- molecule >= 3.0

## Role Variables

```yaml
# General configurations
users_default_shell: /bin/bash
users_create_homedirs: true
# Create groups for users with the same name as the users group even if
# principal groups is specified
users_per_user_groups: true
# Create SSH keys for each user. This will not everwrite existing keys
users_gen_ssh_keys: true
# Number os bits for SSH key
users_ssh_key_bits: 2048
# Path for ssh generate key files
users_ssh_key_file: .ssh/id_rsa
# Users default encrypted password
users_default_password: "$6$f65yHhg479Mkl$4/t3MqK1jn5NfVKb0CDtyr6wKYnaCBQOIAwV8/DG.q1hIOBehICwkhAAM3pGfpLeoRwSgLJKyHa6R/u2vtBn//"

# Lists of users to create or delete
users:
  - name: sirius
    comment: Main Sirius User
    group: sirius
    state: present
    groups:
      - facs
      - imas
      - digs
  - name: facs
    group: facs
    state: present
  - name: imas
    group: imas
    state: present
  - name: digs
    group: digs
    state: present

users_groups:
  - name: sirius
    system: yes
    state: present
  - name: facs
    system: yes
    state: present
  - name: imas
    system: yes
    state: present
  - name: digs
    system: yes
    state: present

users_ssh_keys:
- name: user1
  keys:
    - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDcoWQneQ/fbUmZPnTajzAvXC1XOvhD5+61ZPW8obIZ54OpLcNKyOf4TfceapSAFnKidXv+Z9CZ6foXr2/64bgL43ILvSNUhU2ic4Tzy5ARYJ5o84R61La8/nv5eCQTlgQRTqdW8HVR+xFGNUhG44FqHa+yUXpyadKwIVFYuWQAFZ6qxy2Iwzso229zZa3/jS589aBD/Z83HThttXowYywMqjP68MNnzlb5thpQFkamzXfeziXflGf+mMiiHZHr2NPSOGamgCowqmqRK3Lmq0E1+CIAGzWOuRC0YhW41uu8A09AKScWWb10udPQhkolnwRZxOMXyRQmSAhCV0XrcaBv nope@nowheere.it
    - ssh-rsa AAAA.somestuffgoeshere home@home.com
- name: user3
  keys:
    - ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBBB17LMqtZmwdqXkrlwCMp9fcvRCvi1aU2jd64lmqjQWJoKBSRgRohRCKmcqtBM3nqFHNDnAC2ZBYkEXbRq1F2c= alessio@bradipo
```

## Example Playbook

```yaml
---
- hosts: all
  tasks:
  - import_role:
      name: "{{ playbook_dir }}"
```

## Example Commmand

```bash
ansible-playbook -i host, -u user -k --ask-become-pass playbook.yml
```

## Tests

Tests are performed using Molecule. To run them with python virtualenv, issue:

```bash
    bash -c "\
        cd ../ && \
        virtualenv env --python python3 && \
        source env/bin/activate && \
        cd lnls-ans-role-users && \
        pip install molecule testinfra \
            yamllint ansible-lint flake8 docker-py && \
        molecule test"
```

Optionally, you can specify dns servers to be used for both
provisioner create and run (docker in our case), by using
the following variables:


```bash
    export DNS_SERVER1="<DNS server 1>"
    export DNS_SERVER2="<DNS server 2>"
    export APT_PROXY_SERVER="<APT PROXY URL>"
```

This can be used, for instance, in hosts that have non-default
DNS configurations that docker can't access, such as when
using local systemd-resolv DNS (e.g., 127.x.y.z) or when DNS
servers are set via DHCP with local non-routable IP addresses
(e.g., 10.x.y.z).

## Troubleshooting

If you use a host system with SELinux enabled you might get an error when using
Ansible like the following:

```bash
    "msg": "Aborting, target uses selinux but python bindings (libselinux-python) aren't installed!"
```

If that happens, it might be because virtualenv does not have access to libselinux
and it can't be installed via pip.

A workaround might be to manually copy the librar files into the virtualenv
so that Ansible has access to it.

On a Fedra 29 system, using python3-7, the following fixes the issue:

```bash
    cp -r /usr/lib64/python3.7/site-packages/selinux env/lib64/python3.7/site-packages/
    cp -r /usr/lib64/python3.7/site-packages/_selinux.cpython-37m-x86_64-linux-gnu.so env/lib64/python3.7/site-packages/
```

Be advised, that the python versions might differ and the library names, as well.

## License

BSD 2-clause
