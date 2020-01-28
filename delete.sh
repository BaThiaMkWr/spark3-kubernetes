#!/bin/bash

kubectl delete -f ./kubernetes/spark-master-deployment.yaml
kubectl delete -f ./kubernetes/spark-master-service.yaml
kubectl delete -f ./kubernetes/spark-worker-deployment.yaml
kubectl delete -f ./kubernetes/minikube-ingress.yaml
kubectl delete namespaces spark
docker ps -a | awk '{ print $1,$12 }' | grep spark | awk '{print $1 }' | xargs -I {} docker rm -f {}
