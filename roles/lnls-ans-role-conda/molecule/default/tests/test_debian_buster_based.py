import os
import pytest
import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ["MOLECULE_INVENTORY_FILE"]
).get_hosts("debian_buster_based")


@pytest.mark.parametrize("pkg", ["gnupg", "apt-transport-https"])
def test_default_pkgs(host, pkg):
    package = host.package(pkg)

    assert package.is_installed


@pytest.mark.parametrize(
    "repo",
    [
        "https://repo.anaconda.com/pkgs/misc/debrepo/conda stable/main",
    ],
)
def test_repos(host, repo):
    cmd = host.run("apt-cache policy | grep conda | awk '{print $2,$3}' | sort -u")

    assert repo in cmd.stdout
