import os

# import pytest

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ["MOLECULE_INVENTORY_FILE"]
).get_hosts("all")


def test_csstudio_version(host):
    version = host.file("/opt/cs-studio/ess-version.txt").content_string
    assert version.strip() == "4.6.4"


def test_csstudio_startup_script(host):
    script = host.file("/usr/local/bin/cs-studio")
    assert script.is_file
    assert script.contains("/opt/cs-studio/ESS CS-Studio")


def test_csstudio_binary(host):
    assert host.file("/opt/cs-studio/ESS CS-Studio").exists


def test_fonts(host):
    cmd = host.run('fc-match -s "monospace"')
    # assert cmd.stdout.startswith('n022003l.pfb: "Nimbus Mono L" "Regular"')
    assert "Source Sans Pro" in cmd.stdout
    # assert 'Titillium' in cmd.stdout
    cmd = host.run("fc-list")
    assert "Open Sans" in cmd.stdout
    assert "Roboto" in cmd.stdout
