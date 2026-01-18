#! /bin/bash

IP=$(terraform output -raw public_ip)

cat<<EOF > ../ansible/inventory.ini

[node_exporter]
node1 ansible_host=$IP ansible_user=ec2-user ansible_ssh_private_key_file=~/.ssh/pwskills.pem
EOF

echo "Inventory Generated with Public IP: $IP"