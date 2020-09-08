LNLS Ansible Role Sirius BbB
=======================

This Ansible role configures Bunch-by-Bunch Feedback system for Sirius Light Source control machines.

## Requirements

- ansible >= 2.4
- molecule >= 2.20

## Role Variables

```yaml
---
# Package state; use 'present' to make sure it's installed, or 'latest' if
# you want to upgrade or switch versions using a new repo.
sirius_bbb_packages_state: present

# PIP package state; use 'present' to make sure it's installed, or 'latest' if
# you want to upgrade or switch versions using a new repo.
sirius_bbb_pip_packages_state: present

# Whether to install recommended packages. Used only for Debian/Ubuntu.
sirius_bbb_install_recommends: true

# Repository version
sirius_bbb_version: master

# Sirius BBB EDM screens
sirius_bbb_edm_dir: /usr/local/share/edm/data/bbb

# Sirius BBB bin destination directories
sirius_bbb_bin_dir: /usr/local/bin

# Sirius BBB IGPTOP variable
sirius_bbb_igp_top_dir: "{{ sirius_bbb_edm_dir }}"

# Groups of packages
sirius_bbb_opis:

  - name: OPIs
    org_url: https://gitlab.cnpem.br/DIG
    repo_name: bbb-igp12-sw
    repo_version: "{{ sirius_bbb_version | default(master) }}"
    clone_path: /tmp
    install_via_makefile: true
    make_install_target: install
    make_install_opts:
      INSTALL_EDM_DIR: "{{ sirius_bbb_edm_dir }}"
      INSTALL_BIN_DIR: "{{ sirius_bbb_bin_dir }}"
    force_version: true

# Select which categories to install. Defaults to all
sirius_bbb_install_categories:
  - sirius_bbb_opis

sirius_bbb_config_files:
  - name: Sirius BbB environment variables
    filename: sirius_bbb.sh
    pathname: "/etc/profile.d"
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
        cd lnls-ans-role-sirius-bbb && \
        pip install molecule docker-py && \
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
