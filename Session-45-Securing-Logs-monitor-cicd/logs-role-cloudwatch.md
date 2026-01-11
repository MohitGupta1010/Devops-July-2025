# Demo

- Create EC2 Instance to write logs
- Logs Appear in Cloudwatch Logs
- Use Iam Role

1. Create Role 
    - IAM -> Roles -> Create Role
    - Service EC2
    - Attach CloudWatch Policy
    - CloudWatchAgentServerPolicy
    - Create Role

**Skip Step 2**
2. Create Custome Policy:
    - this just for explanation no need to create
    - because above role already having these all four permission
    - Select Role
    - Edit - Inline Policy - JSON
```json
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "Statement1",
			"Effect": "Allow",
			"Action": [
				"logs:CreateLogGroup",
				"logs:CreateLogStream",
				"logs:PutLogEvents",
				"logs:DescribeLogStreams"
			],
			"Resource": "*"
		}
	]
}
```
- Give Name and save

3. Attach Role to Instance:

    - EC2 --> Select --> Action --> Security --> Modify IAM Role
    - Attach Role which we have just created
    - EC2 --> Instance Setting --> Modify instance Metadata option -> IMDSv2 (Optional)

    - curl http://<public_id>/latest/meta-data/iam/info
    - here you can see iam is attached or not


4. Connect with EC2 instance

```bash
sudo yum install amazon-cloudwatch-agent -y

sudo mkdir /var/log/myapp
sudo touch /var/log/myapp/app.log

echo "Hello Cloud Watch Logs Demo" | sudo tee -a /var/log/myapp/app.log
cat /var/log/myapp/app.log # verify Logs

sudo nano /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json
# edit using below code
```
```json
{
  "logs": {
    "logs_collected": {
      "files": {
        "collect_list": [
          {
            "file_path": "/var/log/myapp/app.log",
            "log_group_name": "/demo/ec2/myapp",
            "log_stream_name": "{instance_id}"
          }
        ]
      }
    }
  }
}
- Validate JSON using below command
- python3 -m json.tool /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json

```
- Configure CloudWatch

```bash
 sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a start -c file:/opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json -m ec2

# Stop Agent Completely
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a stop

# Start Again
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl \
-a start \
-c file:/opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json \
-m ec2

# check status
amazon-cloudwatch-agent-ctl -a status
# generate Fresh logs
echo "FINAL SUCCESS TEST $(date)" | sudo tee -a /var/log/myapp/app.log

# Check Watch Agent Log
sudo tail -f /opt/aws/amazon-cloudwatch-agent/logs/amazon-cloudwatch-agent.log
# it should show like sending message to log group
```
- Go to cloudwatch 
- check LogGroups and LogStreams
- You can see the Log inside the same