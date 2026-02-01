# SQS (Simple Queue Service)

- Steps to implement

1. Create SQS Queue
    - aws console - SQS
    - create queue
    - Select Standard Queue
    - name: order-queue

    - timeout-30 seconds
    - leave rest default -> create
    - copy queue url to use for code

2. Create EC2 Amazon Linx Instance 
    - create Role: EC2SQSRole
    - attach SQSFullAccess Policy

3. Connect with Instance

```bash
sudo yum install python3-boto3
# copy producer.py and consumer.py in instance
# open 2 terminals and connect with instance

python3 producer.py
python3 consumer.py # in another terminal
# now you can see producer send orders proccessed by consumer once it receive message.
```
