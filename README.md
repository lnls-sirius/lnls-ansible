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
      name: lnls-ans-role-epics
  - import_role:
      name: lnls-ans-role-python
```

## Example Commmand

```bash
ansible-playbook -i host, -u user -k --ask-become-pass playbook.yml
```

## License

BSD 2-clause
