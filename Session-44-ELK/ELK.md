# ELK Components

1. ElasticSearch (Storage + Search)
    - stores logs in JSON formar
    - very fast searching and filtering
    - E.g. Show all error logs of last 5 minutes

2. LogStash (Processing)
    - collect logs
    - parse and transforms the logs
    - send logs to ElasticSearch

3. Kibana (UI)
    - Web Dashboard
    - Search Logs
    - Create Graphs, Alerts and Dashboards


## Setup ELK Stack on system

1. Install ElasticSearch

```bash
# Import the Elasticsearch PGP key
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo gpg --dearmor -o /usr/share/keyrings/elasticsearch-keyring.gpg

sudo apt-get install apt-transport-https

echo "deb [signed-by=/usr/share/keyrings/elasticsearch-keyring.gpg] https://artifacts.elastic.co/packages/9.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-9.x.list

sudo apt-get update && sudo apt-get install elasticsearch

sudo systemctl enable elasticsearch.service
sudo systemctl start elasticsearch.service
sudo systemctl status elasticsearch.service
```