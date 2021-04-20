server-commons-update: playbooks/servers/commons.yml
	        ansible-playbook --user server --inventory hosts --ask-pass --ask-become-pass playbooks/servers/commons.yml

server-gluster-update: playbooks/servers/gluster.yml
	        ansible-playbook --user server --inventory hosts --ask-pass --ask-become-pass playbooks/servers/gluster.yml

server-docker-update: playbooks/servers/docker.yml
	        ansible-playbook --user server --inventory hosts --ask-pass --ask-become-pass playbooks/servers/docker.yml
