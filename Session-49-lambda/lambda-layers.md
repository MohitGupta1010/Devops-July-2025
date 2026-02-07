# Lambda Layers

- make reusability of code
- easy to manage libraries, dependencies and custom code across multiple lambda functions.

- When we are creating lambda functions each function can use  upto 5 layers.
- like ows custom layers or third party layers like pandas, numpy.

## Let's Implement

- create folder named layer/python/logger.py file

```py
import logging

def get_logger(name="MyLambda"):
    logger= logging.getLogger(name)
    if not logger.handlers:
        handler = logging.StreamHandler()
        formatter= logging.Formatter(
            "%(asctime)s - %(name)s - %(levelname)s %(message)s"
        )
        handler.setFormatter(formatter)
        logger.addHandler(handler)
        logger.setLevel(logging.INFO)
    return logger

# this is my Reusable code 
```

- Zip this folder
```bash
cd logger-layer
zip -r my-logging-layer.zip python
```

# Create Layer now

- Lambda --> Layers -> create Layer
- give name shared-logging-layer
- zip file upload-> upload created file
- compatible architectures, compatible runtime: python: 3.10
- create

## Create 2 Lambda Functions

- Create lambda function: OrderProcessor

```py
import json
from logger import get_logger
logger =get_logger("Order Service")
def lambda_handler(event, context):
    logger.info("Processing Order Event")
    logger.debug(f"Event Details: {json.dumps(event)}")
    return {
        'statusCode': 200,
        'body': json.dumps({
            "message": "Order processed Successfully"
        })
    }

```
- once function created -> click on layer on the top
- add layer -> select custom
- select shared-logging-layer , version 1(if you have updated that layer you can use perticular version)
- Save

- go to Test Tab
- you can pass some json data

```json
{
    "order_id":1
}
```
- click on Test
- If Test passed successfully logs must be written in cloud watch
- go to cloud watch --> Log management -> LogGroups -> OrderProcessor
- Check generated Logs

## create one more lambda Payment Processor

- Create lambda function: PaymentProcessor

```py
import json
from logger import get_logger
logger =get_logger("Payment Service")
def lambda_handler(event, context):
    logger.info("Processing Payment Event")
    logger.debug(f"Event Details: {json.dumps(event)}")
    return {
        'statusCode': 200,
        'body': json.dumps({
            "message": "Payment processed Successfully"
        })
    }

```
- once function created -> click on layer on the top
- add layer -> select custom
- select shared-logging-layer , version 1(if you have updated that layer you can use perticular version)
- Save

- go to Test Tab
- you can pass some json data

```json
{
    "payment_id":1
}
```
- click on Test
- If Test passed successfully logs must be written in cloud watch
- go to cloud watch --> Log management -> LogGroups -> OrderProcessor
- Check generated Logs

*We can share the common function as layer between multiple lambda functions*

