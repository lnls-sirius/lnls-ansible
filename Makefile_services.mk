# === EthPRUserial485 service ===


# --- Any

sirius-ethserial-service-stop:
	@echo "Stopping EthPRUserial485 services in Beaglebones [hosts]"
	@echo "Please enter password for fac user."
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=stopped" \
		-l $(hosts) \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml

sirius-ethserial-service-start:
	@echo "Starting EthPRUserial485 services in Beaglebones [hosts]"
	@echo "Please enter password for fac user."
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=started" \
		-l $(hosts) \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml

sirius-ethserial-service-restart:
	@echo "Restarting EthPRUserial485 services in Beaglebones [hosts]"
	@echo "Please enter password for fac user (twice)."
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=stopped" \
		-l $(hosts) \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=started" \
		-l $(hosts) \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml


# --- DCLinks

sirius-ethserial-all-dclinks-service-stop:
	@echo "Stopping EthPRUserial485 services in Beaglebones [all dclinks]"
	@echo "Please enter password for fac user."
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=stopped" \
		-l bbb_as_dclinks \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml

sirius-ethserial-all-dclinks-service-start:
	@echo "Starting EthPRUserial485 services in all Beaglebones [all dclinks]"
	@echo "Please enter password for fac user."
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=started" \
		-l bbb_as_dclinks \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml

sirius-ethserial-all-dclinks-service-restart:
	@echo "Restarting EthPRUserial485 services in all Beaglebones [all dclinks]"
	@echo "Please enter password for fac user (twice)."
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=stopped" \
		-l bbb_as_dclinks \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=started" \
		-l bbb_as_dclinks \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml


# --- PS

sirius-ethserial-all-ps-service-stop:
	@echo "Stopping EthPRUserial485 services in Beaglebones [all ps]"
	@echo "Please enter password for fac user."
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=stopped" \
		-l bbb_ps \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml

sirius-ethserial-all-ps-service-start:
	@echo "Starting EthPRUserial485 services in all Beaglebones [all ps]"
	@echo "Please enter password for fac user."
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=started" \
		-l bbb_ps \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml

sirius-ethserial-all-ps-service-restart:
	@echo "Restarting EthPRUserial485 services in all Beaglebones [all ps]"
	@echo "Please enter password for fac user (twice)."
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=stopped" \
		-l bbb_ps \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=started" \
		-l bbb_ps \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml


# === LINAC PS IOC service ===


sirius-iocps-linac-service-stop:
	@echo "Stopping KLinac PS IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=stopped" \
		-u sirius -k --ask-become-pass playbook-linac-iocps-service.yml

sirius-iocps-linac-service-start:
	@echo "Starting Linac PS IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=started" \
		-u sirius -k --ask-become-pass playbook-linac-iocps-service.yml

sirius-iocps-linac-service-restart:
	@echo "Restarting Linac PS IOC services"
	@echo "Please enter password for sirius user (twice)."
	ansible-playbook \
		--extra-vars "ctrl_service_state=stopped" \
		-u sirius -k --ask-become-pass playbook-linac-iocps-service.yml
	ansible-playbook \
		--extra-vars "ctrl_service_state=started" \
		-l $(hosts) \
		-u sirius -k --ask-become-pass playbook-ctrl-service.yml
