import os
import pytest

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ["MOLECULE_INVENTORY_FILE"]
).get_hosts("debian_stretch_based")


@pytest.mark.parametrize(
    "repo",
    [
        "https://epicsdeb.bnl.gov/debian stretch/main",
    ],
)
def test_repos(host, repo):
    cmd = host.run("apt-cache policy | grep http | awk '{print $2,$3}' | sort -u")

    assert repo in cmd.stdout
