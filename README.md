# ansible-ubuntu-node
This is a basic ansible playbook for bootstrapping an Ubuntu 18.04 installation with most of the basics I tend to use. 

Having done a fair bit of experimentation lately in the homelab it felt like it was time to get something updated and available to automate a lot of the initial prep in 2020.

## How to use
This might seem obvious but [install Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) first.

```bash
pip install --user ansible

# Alternatively using the provided Pipfile
pipenv install
```

Now run the playbooks for whatever role you're interested in.

```bash
# Uses an (optional) ansible config file
export ANSIBLE_CONFIG=ansible.cfg

# Call the base role directly and accept default hosts
ansible-playbook -kb --ask-become-pass -i inventoryFile base.yaml -vvvv

# Alternatively, specify the hosts or group (as opposed to `all`). Here
# I'm using the `testvm` host from the example hosts inventory file.
ansible-playbook -kb --ask-become-pass -i hosts -l testvm base.yaml
```

## What's in the box
This repo includes:

### Base
* `pre_tasks` executed to prep the vanilla system
  * Install python and other ansible requirements
* Server hardening
  * Creation of non-root administrative user
  * SSH 
    * via provided keyfile
    * password disabled
    * limited users to just localadmin
    * change to provided/random non-standard port (optional)
    * disable `X11Forwarding`
    * Increase security levels of SSH using appropriate Ciphers / MACs / Keys
  * Firewall with UFW
  * Fail2Ban
* Standard set of utilities I seem to always need
  * wget, curl
  * p7zip
  * nano
  * git
* Avahi mDNS broadcast capabilities for service discovery (optional)

### Limited Accounts
* `syncuser` role for enabling sftp-only access to a server for a specified user+group
* `chrootuser` role for enabling chrooted shell access (incl. rsync) for a specified user+group

### KVM
A simple set of steps to ensure the node has the ability to support virtualisation via KVM (**K**ernel-based **V**irtual **M**achine).
