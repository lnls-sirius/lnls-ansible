LNLS Ansible Role Sirius Apps
=============================

This Ansible role configures some defaults Sirius High Level Applications for Sirius Light Source control machines.

## Requirements

- ansible >= 2.6
- molecule >= 3.0

## Role Variables

```yaml
---
# Groups of packages
sirius_apps_dev_packages:

  - name: Math Phys
    org_url: https://github.com/lnls-fac
    repo_name: mathphys
    repo_version: master
    clone_path: /tmp
    install_via_setup: true

  - name: Development Packages
    org_url: https://github.com/lnls-sirius
    repo_name: dev-packages
    repo_version: master
    clone_path: /tmp
    install_chdir: siriuspy
    install_via_setup: true

sirius_apps_iocs:

  - name: Ethernet PRU-Serial 485 Application
    org_url: https://github.com/lnls-sirius
    repo_name: eth-bridge-pru-serial485
    repo_version: master
    clone_path: /tmp
    install_chdir: client
    install_via_setup: true

  - name: Machine Applications
    org_url: https://github.com/lnls-sirius
    repo_name: machine-applications
    repo_version: master
    clone_path: /tmp
    install_via_makefile: true

sirius_apps_mgmt:

  - name: Scripts
    org_url: https://github.com/lnls-sirius
    repo_name: scripts
    repo_version: master
    clone_path: /tmp
    install_via_makefile: true

# Select which categories to install. Defaults to all
sirius_apps_install_categories:
  - sirius_apps_dev_packages
  - sirius_apps_iocs
  - sirius_apps_mgmt
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
        cd lnls-ans-role-sirius-apps && \
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
