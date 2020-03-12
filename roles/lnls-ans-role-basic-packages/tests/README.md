# Ansible Role tests

To run the test playbook(s) in this directory:

  1. Install and start Docker.  
  1. Download the test shim (see .travis.yml file for the URL) into `tests/test.sh`:  
`wget -O tests/test.sh https://gist.github.com/brentwg/64f90bdda32a51360f71558d3171fcbb/raw/`  
  1. Make the test shim executable: `chmod +x tests/test.sh`.  
  1. Run (from the role's root directory) `distro=[distro] playbook=[playbook] ./tests/test.sh`  

If you **don't** want the container to be automatically deleted after the test playbook is run, then add the following environment variables: `cleanup=false container_id=$(date +%s)`