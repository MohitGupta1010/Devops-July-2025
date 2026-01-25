# Create lambda Function

1. AWS Console -> Search for lambda -> click on that -> create function -> scrach from author ->give function name (MyFirstLambda) ->Runtime (Python 3.14)
-> arch x86_64 -> Create function

2. Add code:

```python 
def lambda_handler(event, context):
    # TODO implement
    return {
        'statusCode': 200,
        'body': 'Hello From Sonam Soni'
    }

```
- click on deploy changes
- move to test tab and click on test check output

**Create API Gateway to trigger Lambda**

- you can see button add trigger
- click on that
- trigger config (select API gateway) -> REST API
- Security (open) -> Add

*click on API Gateway showing here and scroll where you can see endpoit*

- trigger that endpoint and your lambda will respond you.

