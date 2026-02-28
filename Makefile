.PHONY: all base master worker history jupyter

all: base master worker history jupyter

base:
	docker build -t hadoop-hive-spark-base ./base

master:
	docker build -t hadoop-hive-spark-master ./master

worker:
	docker build -t hadoop-hive-spark-worker ./worker

history:
	docker build -t hadoop-hive-spark-history ./history

jupyter:
	docker build -t hadoop-hive-spark-jupyter ./jupyter
