control-room-setup-glusterfs: playbooks/playbook-control-room-glusterfs.yml
	ansible-playbook \
		--user server\
		--inventory hosts\
		--ask-pass\
		--ask-become-pass\
		playbooks/playbook-control-room-glusterfs.yml
