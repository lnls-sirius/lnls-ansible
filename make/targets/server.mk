SERVER_OPTS =\
	--user server\
	--inventory $(SIRIUS_INVENTORY)\
	--ask-pass\
	--ask-become-pass

server-commons-update: playbooks/servers/commons.yml
	        ansible-playbook $(SERVER_OPTS) playbooks/servers/commons.yml

server-gluster-update: playbooks/servers/gluster.yml
	        ansible-playbook $(SERVER_OPTS) playbooks/servers/gluster.yml

server-docker-update: playbooks/servers/docker.yml
	        ansible-playbook $(SERVER_OPTS) playbooks/servers/docker.yml
