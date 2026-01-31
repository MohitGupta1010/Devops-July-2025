# Working With RDS

- Login to AWS Console
- Search or RDS --> Open RDS Dashboard
- create database -> standard Create --> Engine MySQL --> Edition mysql Comm
- Version: 8.0.44 -> Template free tier
- Settings -> Type Name of DB -> pw
- Credentails to set username=admin, set password
- keep all other option as default and create DB
- In RDS once its created you ca see its endpoint using that we can connect with DB

# Create Ubuntu Instance

- connect with SSH
- install only mysql client to connect with DB
```bash
sudo apt update && sudo apt install mysql-client -y
mysql -h <enter_endpoint> -u admin -p
# enter your password
```

## Python App Code

```py
from flask import Flask
import pymysql

app= Flask(__name__)

db_host="<ENDPOINT_RDS>"
db_user="<master_user_name>"
db_pass="<Master_password>"
db_name="<DB_NAME>"

@app.route("/")
def home():
    try:
        conn= pymysql.connect(host=db_host,user=db_user,password=db_pass,
                              database=db_name)
        cursor=conn.cursor()
        cursor.execute("SELCT NOW()")
        result=cursor.fetchone()
        conn.close()
        return f"Connected to RDS! Current Time: {result}"
    except Exception as e:
        return f"Error: {e}"
    

if __name__=="__main__":
    app.run(host="0.0.0.0",port=80)
```

```bash
# create file in AWS instance
# app.py
sudo apt install python3 
sudo apt install python3-venv
# set up venv
python3 -m venv myenv
source myenv/bin/activate
# instal flask and pymysql
pip install flask pysql
# run the code
python3 app.py
```
- check output publicip:5000
- make sure port 5000 is open in Sec group