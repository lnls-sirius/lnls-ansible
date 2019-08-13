# === EthPRUserial485 service ===


# --- Any

sirius-service-ethserial-stop:
	@echo "Stopping EthPRUserial485 services in Beaglebones [hosts]"
	@echo "Please enter password for fac user."
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=stopped" \
		-l $(HOST_GROUPS) \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml

sirius-service-ethserial-start:
	@echo "Starting EthPRUserial485 services in Beaglebones [hosts]"
	@echo "Please enter password for fac user."
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=started" \
		-l $(HOST_GROUPS) \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml

sirius-service-ethserial-restart:
	@echo "Restarting EthPRUserial485 services in Beaglebones [hosts]"
	@echo "Please enter password for fac user (twice)."
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=stopped" \
		-l $(HOST_GROUPS) \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=started" \
		-l $(HOST_GROUPS) \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml


# --- DCLinks

sirius-service-ethserial-all-dclinks-stop:
	@echo "Stopping EthPRUserial485 services in Beaglebones [all dclinks]"
	@echo "Please enter password for fac user."
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=stopped" \
		-l bbb_as_dclinks \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml

sirius-service-ethserial-all-dclinks-start:
	@echo "Starting EthPRUserial485 services in all Beaglebones [all dclinks]"
	@echo "Please enter password for fac user."
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=started" \
		-l bbb_as_dclinks \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml

sirius-service-ethserial-all-dclinks-restart:
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

sirius-service-ethserial-all-ps-stop:
	@echo "Stopping EthPRUserial485 services in Beaglebones [all ps]"
	@echo "Please enter password for fac user."
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=stopped" \
		-l bbb_ps \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml

sirius-service-ethserial-all-ps-start:
	@echo "Starting EthPRUserial485 services in all Beaglebones [all ps]"
	@echo "Please enter password for fac user."
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=started" \
		-l bbb_ps \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml

sirius-service-ethserial-all-ps-restart:
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


# --- All

sirius-service-ethserial-all-stop:
	@echo "Stopping EthPRUserial485 services in Beaglebones [all]"
	@echo "Please enter password for fac user."
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=stopped" \
		-l bbb \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml

sirius-service-ethserial-all-start:
	@echo "Starting EthPRUserial485 services in all Beaglebones [all]"
	@echo "Please enter password for fac user."
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=started" \
		-l bbb \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml

sirius-service-ethserial-all-restart:
	@echo "Restarting EthPRUserial485 services in all Beaglebones [all]"
	@echo "Please enter password for fac user (twice)."
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=stopped" \
		-l bbb \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=started" \
		-l bbb_ps \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml


# === LINAC PS IOC service ===


sirius-service-iocps-linac-stop:
	@echo "Stopping Linac PS IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=stopped" \
		-u sirius -k --ask-become-pass playbook-service-iocps-linac.yml

sirius-service-iocps-linac-start:
	@echo "Starting Linac PS IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=started" \
		-u sirius -k --ask-become-pass playbook-service-iocps-linac.yml

sirius-service-iocps-linac-restart:
	@echo "Restarting Linac PS IOC services"
	@echo "Please enter password for sirius user (twice)."
	ansible-playbook \
		--extra-vars "ctrl_service_state=stopped" \
		-u sirius -k --ask-become-pass playbook-service-iocps-linac.yml
	ansible-playbook \
		--extra-vars "ctrl_service_state=started" \
		-u sirius -k --ask-become-pass playbook-service-iocps-linac.yml


# === PS IOC service ===


sirius-service-iocps-stop:
	@echo "Stopping PS IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=stopped" \
		-u sirius -k --ask-become-pass playbook-service-iocps.yml

sirius-service-iocps-start:
	@echo "Starting PS IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=started" \
		-u sirius -k --ask-become-pass playbook-service-iocps.yml

sirius-service-iocps-restart:
	@echo "Restartin PS IOC services"
	@echo "Please enter password for sirius user (twice)."
	ansible-playbook \
		--extra-vars "ctrl_service_state=stopped" \
		-u sirius -k --ask-become-pass playbook-service-iocps.yml
	ansible-playbook \
		--extra-vars "ctrl_service_state=started" \
		-u sirius -k --ask-become-pass playbook-service-iocps.yml


# === MA IOC service ===


sirius-service-iocma-stop:
	@echo "Stopping MA IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=stopped" \
		-u sirius -k --ask-become-pass playbook-service-iocma.yml

sirius-service-iocma-start:
	@echo "Starting MA IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=started" \
		-u sirius -k --ask-become-pass playbook-service-iocma.yml

sirius-service-iocma-restart:
	@echo "Restartin MA IOC services"
	@echo "Please enter password for sirius user (twice)."
	ansible-playbook \
		--extra-vars "ctrl_service_state=stopped" \
		-u sirius -k --ask-become-pass playbook-service-iocma.yml
	ansible-playbook \
		--extra-vars "ctrl_service_state=started" \
		-u sirius -k --ask-become-pass playbook-service-iocma.yml
