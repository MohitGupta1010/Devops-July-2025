# DynamoDB

- DynamoDB is Serverless, high performance and No SQL DB service in AWS
- best for app needs fast and scalable data access

## Steps to create DB

- Login to aws Console
- search for dynamoDB -> Open Dashboard
- create table -> Name(Users) -> Partition Key (UserID) -- string
- sort key is optionl if want you can use email 
- table settings - default
- create table -> See users
- create Item
- insert data by adding attributes

## Access From CLI

```bash
# Get Items
aws dynamodb get-item \
--table-name Users \
--key '{"UserID":{"S":"U0001"}}'

# Create NEw
aws dynamodb put-item \
--table-name Users \
--item '{
    "UserID":{"S":"U0002"},
    "Name":{"S":"Alex"},
    "Email":{"S":"alex@gmail.com"},
    "Age":{"N":"34"}
}'

```

### Setup Python Code

- Create python-db.py
- add code as shown here

```bash
python3 -m venv myenv
source myenv/bin/activate
pip install boto3
python3 python-db.py
```