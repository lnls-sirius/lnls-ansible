import os
import pytest

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']).get_hosts('ubuntu_xenial_based')


@pytest.mark.parametrize('repo', [
    'https://epicsdeb.bnl.gov/debian stretch/staging/main',
    'http://deb.debian.org/debian stretch/main',
    'http://security.debian.org/debian-security stretch/updates/main'
])
def test_repos(host, repo):
    cmd = host.run('apt-cache policy | grep http | awk \'{print $2,$3}\' | sort -u')

    assert repo in cmd.stdout


# TODO: use epics version variables here?
@pytest.mark.parametrize('pkg_pin', [
    ('epics-dev', '3.15'),
    ('epics-perl', 'none')
])
def test_pkg_pin(host, pkg_pin):
    cmd = host.run('apt-cache policy {0} | grep "Candidate:" | sed -e \'s/Candidate://g\''.format(pkg_pin[0]))

    assert pkg_pin[1] in cmd.stdout
