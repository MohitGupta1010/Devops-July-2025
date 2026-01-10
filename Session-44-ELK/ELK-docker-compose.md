# Setup ELK stack using Docker Compose

- create folder named ELK-Demo
- move to that folder create
- docker-compose.yml
- which is creating 3 containers
- create app.py file to generate Random Logs
- create logstash.conf file to send log to ElasticSearch

```bash
docker compose up -d
# once all containers up
dockerp ps
docker logs elasticsearch
docker logs kibana
# in Logs when you see its available
# access elsaticsearch localhost:9200/
# access kibala localhost:5601/

# Now to generate Logs
python3 app.py

```
- go to Kibana Dashboard
- left side panel click on discover --> create index pattern

- type: python-logs-*
- again click on discover, you can see all logs of your application

**What is actually happening**

- Python app sends raw JSON logs --> LogStash --> Received on port 5044
- push it to elasticsearch with proper format 

- elasticsearch stores it in index like python-logs-date.. format

- If you wnat to get data you can search
- GET python-logs-2026.01.10/_search (find app logs)

- inside kibana also you can search: python log #5

### KQL

- Kibana Query Language

- * (show all)
- Filter By Log Level

- level : "ERROR"
- level : ("ERROR" or "WARNING)

*Filter By Message*

- message : "failed"

*Filter By endpoint*

- endpoint : "/login"