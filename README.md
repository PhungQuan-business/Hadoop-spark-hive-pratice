# Hadoop-Hive-Spark cluster + Jupyter on Docker

## Caution
Do not use in a production environment

## Software

* [Hadoop 3.3.6](https://hadoop.apache.org/)

* [Hive 3.1.3](http://hive.apache.org/)

* [Spark 3.5.3](https://spark.apache.org/)

## Quick Start

To deploy the cluster, run:
```sh
# install make
sudo apt install make
```

```sh
make all
docker-compose up
```

Download the flight dataset
```sh
mkdir -p jupyter/notebook/flight-data

# Download file directly into that directory
curl -L -o jupyter/notebook/flight-data/airline-delay-analysis.zip \
  https://www.kaggle.com/api/v1/datasets/download/normalusage/airline-delay-analysis

# Unzip it
unzip jupyter/notebook/flight-data/airline-delay-analysis.zip \
  -d jupyter/notebook/flight-data

# Optional: remove the zip file after extraction
rm jupyter/notebook/flight-data/airline-delay-analysis.zip
```

Push the dataset to HDFS

Access Jupyter Lab at `http://<vps-ip>:8888` and create a terminal
![push data folder to hdfs](/images/push_raw_data_2_hdfs.png)

```sh
# Push raw data to hdfs 
hdfs dfs -put notebook/flight-data/airline_delay_analysis  /user/jupyter/airline_delay_analysis

# Check if data is already in hdfs
hdfs dfs -ls /user/jupyter/airline_delay_analysis
```
## Access interfaces with the following URL

### Hadoop

ResourceManager: `http://<vps-ip>:8088`

NameNode: `http://<vps-ip>:9870`

HistoryServer: `http://<vps-ip>:19888`

Datanode1: `http://<vps-ip>:9864`
Datanode2: `http://<vps-ip>:9865`

NodeManager1: `http://<vps-ip>:8042`
NodeManager2: `http://<vps-ip>:8043`

### Spark
master: `http://<vps-ip>:8080`

worker1: `http://<vps-ip>:8081`
worker2: `http://<vps-ip>:8082`

history: `http://<vps-ip>:18080`

### Hive
URI: jdbc:hive2://localhost:10000

### Jupyter Notebook
URL: `http://<vps-ip>:8888`

example: [jupyter/notebook/pyspark.ipynb](jupyter/notebook/pyspark.ipynb)

