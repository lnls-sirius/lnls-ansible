control-room-install-glusterfs: playbook-glusterfs-server.yml
	                        ansible-playbook --user server --inventory hosts --ask-pass --ask-become-pass playbook-glusterfs.yml
