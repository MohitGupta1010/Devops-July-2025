import boto3
import json
import uuid

sqs = boto3.client('sqs', region_name='us-east-1')

QUEUE_URL = "PASTE_YOUR_QUEUE_URL"

order = {
    "orderId": str(uuid.uuid4()),
    "user": "sonam",
    "amount": 2500,
    "status": "CREATED"
}

response = sqs.send_message(
    QueueUrl=QUEUE_URL,
    MessageBody=json.dumps(order)
)

print("Order sent to queue:", order)
