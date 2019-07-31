LNLS Ansible Role CS-Studio
=======================

References: https://bitbucket.org/europeanspallationsource/ics-ans-role-cs-studio

This Ansible role configures CS-Studio for Sirius Light Source control machines.

## Requirements

- ansible >= 2.4
- molecule >= 2.20

## Role Variables

```yaml
csstudio_version: 4.6.1.25
csstudio_repository: production
csstudio_base_url: "https://artifactory.esss.lu.se/artifactory/CS-Studio"
csstudio_archive: "{{ csstudio_base_url }}/{{ csstudio_repository }}/{{ csstudio_version }}/cs-studio-ess-{{ csstudio_version }}-linux.gtk.x86_64.tar.gz"
# When changing the fonts, don't forget to remove
# the previous directories!
csstudio_fonts: https://artifactory.esss.lu.se/artifactory/swi-pkg/fonts/cs-studio-fonts-20180222.tgz
csstudio_fonts_dir: /usr/share/fonts/ess-20180222
# xulrunner downloaded from http://releases.mozilla.org/pub/xulrunner/nightly/2012/05/2012-05-13-03-32-04-mozilla-1.9.2/
# x86_64 version only available in nightly (not in releases)
csstudio_xulrunner_version: 1.9.2.29pre
csstudio_xulrunner: https://artifactory.esss.lu.se/artifactory/swi-pkg/xulrunner/xulrunner-{{ csstudio_xulrunner_version }}.en-US.linux-x86_64.tar.bz2

# ":" separated list of addresses
csstudio_ca_addr_list: localhost
# Max array bytes
csstudio_ca_max_array_bytes: 10000000
```

## Example Playbook

```yaml
---
- hosts: all
  tasks:
  - import_role:
      name: '{{playbook_dir}}'
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
        cd lnls-ans-role-cs-studio && \
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
