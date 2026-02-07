# Implement Application Load Balancer

- to implement we need 2 ubuntu instances
- create EC2 Instance -> AMI Ubuntu -> Network select default VPC
- in subnets choose diffrent like 1 with 1b and another one with 1c
- sec group open port 22 and 80 - create instance

- Connect to your both instance and setup nginx running

```bash
sudo apt update && sudo apt install nginx -y
cd /var/www/html
sudo nano index.html # add message
# <h1>Hello From Server 1 </h1>
# <h1>Hello From Server 2 </h1>
sudo systemctl enable nginx
sudo systemctl start nginx
```

## Setting up a target Group

- on ec2 -> services --> scroll down to load balancer under that you can see
- target group - create target group - give name - continue with all default options -> next --> select instances which you wnat to add in your target group 
- then click on add pending targets below and then create target group

## Create Load Balancer

- create load balancer -> ALB -> give name
- scheme - internet facing, Ip- ipv4
- vpc - default, select availability zone 1b,1c
- sec group: default and the one where you have added instances
- listener -> HTTP -> in default action select target group 
- create load balancer

*it will take a time to create load balancer*

- once the state is active
- open its dns in browser and check response will come from diffrent instances
- after this you can also check health of your target group which showing 2/2 nodes are healthy