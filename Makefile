linac-opi:
	ansible-playbook -i hosts -l linac-opi -u sirius -k --ask-become-pass playbook.yml
