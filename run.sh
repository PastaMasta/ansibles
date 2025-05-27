#! /bin/bash
[[ -n ${DEBUG} ]] && set -x

ansible-playbook -i ./inventory.yaml ./playbooks/site.yaml --ask-become-pass
