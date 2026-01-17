# Achieve Automation to setup monitoring tools using IaaC

- Use Terraform 
    - create EC2 instance
    - Generate Ansible Inventory
    - Call Ansible Playbook
    - install and start Prometheus & Node Exporter.

**Extras**
- static (After creating EC2 will create inventory automatically which is static)
- dynamic Inventory (if we have ec2 using terraform we can use aws plugin to fetch the ec2)

- CI CD for auto executes
- lets take simple app (Python Web APP / Node APP )

