LNLS Ansible Role for Network
=======================

This Ansible role configures some network parameters for Sirius Light Source control machines.

## Requirements

- ansible >= 2.6
- molecule >= 3.0

## Role Variables

```yaml
---
# Package versions for Debia. Leave empty for the latest
pkg_version_network_manager: ""
pkg_version_python_dbus: ""
pkg_version_python3_dbus: ""
pkg_version_libnm_glib_dev: ""

# Package versions for Fedora-like. Leave empty for the latest
pkg_version_network_manager_glib: ""
pkg_version_libnm_qt_devel: ""
pkg_version_nm_connection_editor: ""
pkg_version_libsemanage_python: ""
pkg_version_policycoreutils_python: ""

# Set this to true when using this in a regular,
# without systemd support.
network_ignore_systemd_errors: false

network_interfaces:
  - name: TIC
    ignore_auto_dns: "true"

  - name: CONS
    ignore_auto_dns: "false"

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
        cd lnls-ans-role-network && \
        pip install molecule testinfra
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
