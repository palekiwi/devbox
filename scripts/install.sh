#!/bin/bash

dir=~/.venv/ansible

if [ ! -d $dir ]; then
    echo "Creating venv dir..."
    mkdir -p $dir
fi

echo "Creating python venv in ${dir}..."
python -m venv $dir

echo "Activating venv..."
source $dir/bin/activate

echo "Installing ansible..."
pip install ansible

echo "Installing roles from requirements..."
ansible-galaxy install -r requirements.yml

echo "Building dev image..."
ansible-playbook playbooks/dev_image.yml

echo "Creating dev container..."
ansible-playbook playbooks/dev_create.yml

echo "Provisioning dev container..."
ansible-playbook playbooks/main.yml -e ansible_connection=podman

echo -e "\nDONE\n"
