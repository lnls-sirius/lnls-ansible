server-commons-update: playbook-servers/playbook-servers-commons.yml
	        ansible-playbook --user server --inventory hosts --ask-pass --ask-become-pass playbook-servers/playbook-servers-commons.yml

server-gluster-update: playbook-servers/playbook-servers-gluster.yml
	        ansible-playbook --user server --inventory hosts --ask-pass --ask-become-pass playbook-servers/playbook-servers-gluster.yml

server-docker-update: playbook-servers/playbook-servers-docker.yml
	        ansible-playbook --user server --inventory hosts --ask-pass --ask-become-pass playbook-servers/playbook-servers-docker.yml
