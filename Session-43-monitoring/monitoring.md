# Monitoring using Promethues and Grafana

- Prometheus is open-source Monitoring and alerting Tool.
- It collects and store real time series data (metrics) from application,servers and databases.
- It works on Pull Models, Scraps metrics from application and expose endpoints

- Its having Its own query Language which is PromQl
- it also sends alert via alert manager.

- We can manually also donwload from
[Download Prometheus](https://prometheus.io/download/)

- you can edit prometheus.yml file as per your requirements 
- run application it will start on port 9090
- loclahost:9090 (prometheus Dashboard)

# To Start Promethues using Docker Image

- To combine prometheus with Grafana and Python app 
- create folder and under that create files

    - docker-compose.yml (main file to run all services)
    - prometheus.yml (config file for prometheus)
    - app.py (code for python app)
    - requirements.txt (dependency for Python app)
    - Dockerfile (Python-app Image)

```bash
# open above folder location in cmd or terminal
docker compose up -d --build
docker ps
docker logs
# If all good then access 

```
http://localhost:9090/targets (check prometheus targets)
http://localhost:3000 (grafana dashboard) - access admin/admin
http://localhost:5000 (Python App)

- to check metrics of python app
http://localhost:5000/metrics

