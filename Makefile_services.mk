sirius-ethserial-bbb-as-dclinks-tbts-service-stop:
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=stopped" \
		-l bbb_as_dclinks_tbts \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml

sirius-ethserial-bbb-as-dclinks-tbts-service-start:
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=started" \
		-l bbb_as_dclinks_tbts \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml

sirius-ethserial-bbb-si-ps-dipoles-service-stop:
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=stopped" \
		-l bbb_si_ps_dipoles \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml

sirius-ethserial-bbb-si-ps-dipoles-service-start:
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=started" \
		-l bbb_si_ps_dipoles \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml
