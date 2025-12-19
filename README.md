# Wireguard-Infrastructure

Infrastructure-as-Code for Hetzner Cloud to host a WireGuard server, plus Ansible to install and configure WireGuard for friends and family.

## Overview
- OpenTofu provisions Hetzner resources labeled for a WireGuard role.
- Ansible uses a dynamic Hetzner inventory to find the server and configures WireGuard peers via variables.

## Prerequisites
- Hetzner Cloud API token (`HCLOUD_TOKEN`).
- OpenTofu (`tofu`) and Ansible installed.
- Ansible Hetzner collection:
  ```bash
  ansible-galaxy collection install hetzner.hcloud
  ```

## Deploy Infrastructure (OpenTofu)
1. Copy sample variables and edit:
	- [opentofu/opentofu.auto.sample.tfvars](opentofu/opentofu.auto.sample.tfvars) → `opentofu.auto.tfvars`
2. Initialize and apply:
	```bash
	cd opentofu
	tofu init
	tofu apply
	```

## Configure Server (Ansible)
1. Set your token:
	```bash
	export HCLOUD_TOKEN="<your_token>"
	```
2. Inventory is preconfigured in [ansible/ansible.cfg](ansible/ansible.cfg) to use [ansible/hcloud.yml](ansible/hcloud.yml). It auto-groups the server under `wireguard_servers` based on label `role=wireguard-server` and sets `ansible_host` with IPv6→private IPv4→public IPv4 fallback.
3. Provide WireGuard vars (server keys, peers, preshared keys, AllowedIPs):
	- Copy sample and fill secrets:
	  ```bash
	  cp ansible/group_vars/sample.wireguard_servers.yml ansible/group_vars/wireguard_servers.yml
	  ```
	- `wireguard_servers.yml` is git-ignored; only the sample is committed.
4. SSH key default is set in [ansible/ansible.cfg](ansible/ansible.cfg) to `~/.ssh/opentofu_automation_rsa`. Override per-run with:
	```bash
	ansible-playbook playbook.yml -e ansible_ssh_private_key_file=~/.ssh/your_key
	```
5. Test inventory:
	```bash
	ansible-inventory -i ansible/hcloud.yml --list | jq '.wireguard_servers'
	```
6. Apply configuration:
	```bash
	cd ansible
	ansible-playbook playbook.yml
	```