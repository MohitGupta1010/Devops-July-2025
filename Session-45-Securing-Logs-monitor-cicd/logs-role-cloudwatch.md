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

2. Create Custome Policy:
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
            "log_stream_name": "{instance_id}",
            "timezone": "UTC"
          }
        ]
      }
    }
  }
}
```
- Configure CloudWatch

```bash
 sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a start -c file:/opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json -m ec2
```
- Go to cloudwatch 
- check LogGroups and LogStreams
- You can see the Log inside the same