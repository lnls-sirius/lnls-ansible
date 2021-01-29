LNLS Ansible
=======================

[![Build Status](https://travis-ci.org/lnls-sirius/lnls-ansible.svg)](https://travis-ci.org/lnls-sirius/lnls-ansible)
[![Ansible Lint](https://github.com/lnls-sirius/lnls-ansible/workflows/Ansible%20Lint/badge.svg)](https://github.com/lnls-sirius/lnls-ansible/actions?query=workflow%3A%22Ansible+Lint%22)

This Ansible roles/playbooks for Sirius Light Source control machines.


## Simple makefile targets:

```
make deploy-control-room-desktops
make deploy-fac-desktops
make deploy-linac-opi-desktops
```


## Example Playbook

```yaml
---
- hosts: all
  remote_user: sirius
  become: true

  pre_tasks:
    - name: Include distribution-dependent variables
      include_vars: "{{ item }}"
      vars:
        possible_var_files:
          - "group_vars/{{ ansible_distribution }}-{{ ansible_distribution_release }}.yml"
          - "group_vars/{{ ansible_distribution }}.yml"
          - "group_vars/{{ ansible_os_family }}.yml"
      loop: "{{ q('first_found', possible_var_files, errors='ignore') }}"

  roles:
    - role: lnls-ans-role-repositories
    - role: lnls-ans-role-users
      when: global_role_users | default(true) | bool
    - role: lnls-ans-role-network
      when: global_network_role | default(true) | bool
    - role: lnls-ans-role-nvidia-driver
      when: global_import_nvidia_driver_role | default(false) | bool
    - role: lnls-ans-role-ntp
    - role: lnls-ans-role-nfsclient
    - role: lnls-ans-role-zabbix
    - role: lnls-ans-role-python
    - role: lnls-ans-role-epics
    - role: lnls-ans-role-epics7
    - role: lnls-ans-role-qt
    - role: lnls-ans-role-java
      when: global_role_java | default(true) | bool
    - role: lnls-ans-role-cs-studio
      when: global_role_cs_studio | default(true) | bool
    - role: lnls-ans-role-pydm
    - role: lnls-ans-role-phoebus
      when: global_role_phoebus | default(true) | bool
    - role: lnls-ans-role-sirius-bbb
      when: global_role_sirius_bbb | default(true) | bool
    - role: lnls-ans-role-octave
      when: global_role_octave | default(true) | bool
    - role: lnls-ans-role-epics-mca
      when: global_role_epics_mca | default(true) | bool
    - role: lnls-ans-role-sirius-apps
    - role: lnls-ans-role-sirius-hla
    - role: lnls-ans-role-desktop-apps
    - role: lnls-ans-role-desktop-settings
      when: global_role_desktop_settings | default(true) | bool
    - role: lnls-ans-role-visual-studio-code
      when: global_role_visual_studio | default(true) | bool
```

## Example Commmand

```bash
    ansible-playbook -i host, -u user -k --ask-become-pass <playbook>.yml
```
## Runing Ansible Playbooks

The easiest way to run playbooks on a set of hosts is to use the Makefile:

```bash
    make <playbook_name_without_yml_extension>
```

Example, is you want to run the playbook-control-room-desktops.yml playbook
on the set of predefined hosts (see inside playbook), run:

```bash
    make playbook-control-room-desktops
```

To further limit selected hosts to an additional pattern, run:

```bash
    make playbook-control-room-desktops HOST_GROUPS=<pattern>
```

## Set SSH RSA/DSA key so you don't need to type the password everytime

In order to do that run the playboob playbook-setup-ssh-keys.yml like:

```bash
    ansible-playbook -i hosts -u sirius -k --ask-become-pass playbook-setup-ssh-key.yml
```

There is also a make target that automates this. So you can run:

```bash
    make playbook-setup-ssh-key
```

If asked for the Ansible Vault password, type any word...

## Make variables

The Makefile contains variables that control how options are passed to ansible.

To change the default values do `<VARIABLE_NAME>=<VALUE>`.

The following shows which variables are available:

```bash
DNS_SERVER1 ?= 10.0.0.71
DNS_SERVER2 ?= 10.0.0.72
```

Optional DNS servers to be passed to Molecule. Only used
when running Molecule tests.

```bash
MOLECULE_DISTRO ?= debian:buster
```

Docker image to be used in Molecule tests.

```bash
BUILD_TYPE ?= default
```

Molecule build type. Options are "default" or "debug".

```bash
HOST_GROUPS ?= linac_opi
```

Ansible host groups. Check "hosts" file to see all possible
host groups.


```bash
REMOTE_USER ?= sirius
```

Ansible remote SSH user to log in in remote host.


```bash
ASK_FOR_PASS ?= y

```

Ask for password. Options are "y" or "n". Use "n" when
ssh keys are on remote host.

```bash
ASK_FOR_VAULT_PASS ?= y
```

Ask for vault password. Options are "y" or "n". Use "y" when
running a playbook that uses a vault encrypted password.

## Runing Molecule tests locally

To run all tests

```bash
    make tests
```

To run a specific test

```bash
    make test_<ROLE_NAME>
```

For example, to run tests for lnls-ans-role-users role:

```bash
    make test_lnls-ans-role-users
```

Optionally, specify DNS servers for docker molecule images

```bash
    make test_lnls-ans-role-users DNS_SERVER1=<ip> DNS_SERVER2=<ip>
```

Optionally, specify the docker distro to run molecule against

```bash
    make test_lnls-ans-role-users MOLECULE_DISTRO=<distro>
```

## Installation

To install all roles avaialble at the ansible default directory:

```bash
    ansible-galaxy install git+https://github.com/lnls-sirius/lnls-ansible,master
```

If the role is already installed and you want to force an upgrade:


```bash
    ansible-galaxy install -f git+https://github.com/lnls-sirius/lnls-ansible,master
```
### Dependencies
```bash
ansible-galaxy install -r requirements.yml
```

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

On a Fedora 29 system, using python3-7, the following fixes the issue:

```bash
    cp -r /usr/lib64/python3.7/site-packages/selinux env/lib64/python3.7/site-packages/
    cp -r /usr/lib64/python3.7/site-packages/_selinux.cpython-37m-x86_64-linux-gnu.so env/lib64/python3.7/site-packages/
```

Be advised, that the python versions might differ and the library names, as well.

## License

BSD 2-clause
