

gas-docker-BbB: playbooks/gas-docker/docker-iocs-BbB.yml
	ansible-playbook \
		--inventory inventories/gas-iocs \
		--verbose  playbooks/gas-docker/docker-iocs-BbB.yml

