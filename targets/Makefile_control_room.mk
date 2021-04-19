control-room-setup-glusterfs: playbook-control-room-glusterfs.yml
	ansible-playbook \
		--user server\
		--inventory hosts\
		--ask-pass\
		--ask-become-pass\
		playbook-control-room-glusterfs.yml
