# Directories
ROLES_DIR = ./roles
PLAYBOOKS_DIR = ./playbooks
INVENTORIES_DIR = ./inventories

# DNS Setttings
DNS_SERVER1 ?= 10.0.0.71
DNS_SERVER2 ?= 10.0.0.72
export DNS_SERVER1
export DNS_SERVER2

# Settings
BEAGLEBONE_INVENTORY = $(INVENTORIES_DIR)/beaglebones
SIRIUS_INVENTORY = $(INVENTORIES_DIR)/sirius

ALL_INVENTORIES =\
    $(BEAGLEBONE_INVENTORY)\
    $(SIRIUS_INVENTORY)

HOST_GROUPS ?=
REMOTE_USER ?= sirius
ASK_FOR_PASS ?= y
ASK_FOR_VAULT_PASS ?= y
ANSIBLE_EXTRA_VARS ?=

EXTRA_OPTS =
ifneq ($(REMOTE_USER),)
	EXTRA_OPTS += --user $(REMOTE_USER)
else
	EXTRA_OPTS +=
endif

ifneq ($(HOST_GROUPS),)
	EXTRA_OPTS += --inventory $(ALL_INVENTORIES) --limit $(HOST_GROUPS)
else
	EXTRA_OPTS += --inventory $(ALL_INVENTORIES)
endif

ASK_FOR_VAULT_PASS_FILTER=$(if $(filter y,${ASK_FOR_VAULT_PASS}),true,false)
ifeq ($(ASK_FOR_VAULT_PASS_FILTER),true)
	EXTRA_OPTS += --ask-vault-pass
else
	EXTRA_OPTS +=
endif

ASK_FOR_PASS_FILTER=$(if $(filter y,${ASK_FOR_PASS}),true,false)
ifeq ($(ASK_FOR_PASS_FILTER),true)
	EXTRA_OPTS += --ask-pass --ask-become-pass
else
	EXTRA_OPTS +=
endif

ifneq ($(ANSIBLE_VARS),)
	EXTRA_OPTS += --extra-vars "$(ANSIBLE_VARS)"
else
	EXTRA_OPTS +=
endif

# Targets
include ./make/targets/test.mk
include ./make/targets/generic.mk
include ./make/targets/control_room.mk
include ./make/targets/deploy.mk
include ./make/targets/reboot.mk
include ./make/targets/server.mk
include ./make/targets/services.mk
