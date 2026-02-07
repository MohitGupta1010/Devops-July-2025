# Understand Code Deploy 

- Guthub Repo --> Aws Code Deploy --> EC2 Instance (CodeDeploy Agent)

## Step1: Create Amazon Linux instance

- name: codedeploy-demo

## CreateRole For EC2 Code Deploy

- Create Role -> Select EC2-> ServiceRoleEc2CodeDeploy
- policies - CodeDeployRole, CodeDepoyFullAccess,S3ReadOnlyAccess
- Attach this role to EC2 using security modify role

## Step2: 

- connect with instance usinh SSH
- Setup Code Deploy agent in Linux/RHEL
[reference Link](https://docs.aws.amazon.com/codedeploy/latest/userguide/codedeploy-agent-operations-install-linux.html)

```bash
sudo yum update
sudo yum install ruby wget

cd /home/ec2-user
wget https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/latest/install #change as per your region

chmod +x ./install
sudo ./install auto
systemctl status codedeploy-agent # check status
```

*This Agent listenes for deployment instructions from Code Deploy*

## Create Application Code
- your project code
- appspec.yml
- scripts
    - install_dependencies.sh
    - start_server.sh
    - stop_server.sh

[Reference Code](https://github.com/sonam-niit/CodeDeployDemo/tree/main)

## Create Deployment Group

- CodeDeploy in Aws Console
- Create Application -> Name: myapp
- Compute Platform: EC2/on-Premises

- Before Creating Deployment Group
- Create Role: CDServiceRole (name)
- select CodeDeploy and policy will come by default
- use that and create Role

- open app and under that you can see option to create deployment group

- Above Created role ARN add here
- also
- select EC2 Instance: 
    Name: your instance name

- desect load balancing
- create deployment group

## Create Deployment

- select deployment group
- select github
- give any alias name and click on connect to github
- Repository Link: username/reponame
- Create Deployment

- Once Succeeded check in browser by accessing public IP
- you app must be deployed by CodeDeploy to your instance
