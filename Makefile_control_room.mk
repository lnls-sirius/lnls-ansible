control-room-setup-glusterfs: playbook-control-glusterfs.yml
	                        ansible-playbook \
								--user server\
								--inventory hosts\
								--ask-pass\
								--ask-become-pass\
								playbook-control-glusterfs.yml
