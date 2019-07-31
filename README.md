LNLS Ansible
=======================

[![Build Status](https://travis-ci.org/lnls-sirius/lnls-ansible.svg)](https://travis-ci.org/lnls-sirius/lnls-ansible)

This Ansible roles/playbooks for Sirius Light Source control machines.

## Example Playbook

```yaml
---
- hosts: all
  become: true
  tasks:
  - import_role:
      name: lnls-ans-role-users
  - import_role:
      name: lnls-ans-role-repositories
  - import_role:
      name: lnls-ans-role-nfsclient
  - import_role:
      name: lnls-ans-role-epics
  - import_role:
      name: lnls-ans-role-python
  - import_role:
      name: lnls-ans-role-java
  - import_role:
      name: lnls-ans-role-cs-studio
```

## Example Commmand

```bash
ansible-playbook -i host, -u user -k --ask-become-pass playbook.yml
```

## Runing Molecule tests locally

To run all tests

```bash
make tests
```

To run a specific test

```bash
make tests_<ROLE_NAME>
```

For example, to run tests for lnls-ans-role-users role:

```bash
make tests_lnls-ans-role-users
```

Optionally, specify DNS servers for docker molecule images

```bash
make tests_lnls-ans-role-users DNS_SERVER1=<ip> DNS_SERVER2=<ip>
```

Optionally, specify the docker distro to run molecule against

```bash
make tests_lnls-ans-role-users MOLECULE_DISTRO=<distro>
```

## License

BSD 2-clause
