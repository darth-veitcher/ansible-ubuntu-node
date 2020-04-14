# ansible-ubuntu-node
This is a basic ansible playbook for bootstrapping an Ubuntu 18.04 installation with most of the basics I tend to use. 

Having done a fair bit of experimentation lately in the homelab it felt like it was time to get something updated and available to automate a lot of the initial prep in 2020.

## How to use
```bash
# Uses an (optional) ansible config file
export ANSIBLE_CONFIG=ansible.cfg && ansible-playbook -kb --ask-become-pass -i inventoryFile role.yml -vvvv
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

### Announce
* Avahi mDNS broadcast capabilities