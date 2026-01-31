import boto3

dynamodb= boto3.resource('dynamodb',region_name='us-east-1')

table = dynamodb.Table('Users')

table.put_item(
    Item={
        'UserID':'U0003',
        'Name':'Bob',
        'Email':'boba@gmail.com'
    }
)

print('Item Inserted')

response= table.get_item(
    Key={
        'UserID':'U0003'
    }
)

print('Retrived Items: ',response.get('Item'))

# get All

response = table.scan()
print("All items",response['Items'])