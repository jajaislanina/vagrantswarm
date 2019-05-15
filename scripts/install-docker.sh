#!/usr/bin/env bash

set -e

echo '**Running ansible playbook**'
ansible-playbook /vagrant/docker.yml
