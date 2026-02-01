import boto3
import json
import time

sqs = boto3.client('sqs', region_name='us-east-1')

QUEUE_URL = "PASTE_YOUR_QUEUE_URL"

while True:
    messages = sqs.receive_message(
        QueueUrl=QUEUE_URL,
        MaxNumberOfMessages=1,
        WaitTimeSeconds=10
    )

    if "Messages" in messages:
        for msg in messages["Messages"]:
            order = json.loads(msg["Body"])
            print("Processing order:", order)

            # simulate email sending
            print(f"Email sent for order {order['orderId']}")

            # delete message
            sqs.delete_message(
                QueueUrl=QUEUE_URL,
                ReceiptHandle=msg["ReceiptHandle"]
            )
    else:
        print("No messages...")
        time.sleep(5)
