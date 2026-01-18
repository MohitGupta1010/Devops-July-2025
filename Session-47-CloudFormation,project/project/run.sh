#! /bin/bash

cd terraform
terraform init

terraform apply --auto-approve
chmod +x generate_inventory.sh

./generate_inventory.sh