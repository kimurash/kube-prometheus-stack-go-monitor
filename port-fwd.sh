#!/bin/bash

# Prometheus
kubectl port-forward -n monitoring svc/kube-prometheus-stack-prometheus 9090:9090 &

# Grafana
kubectl port-forward -n monitoring svc/kube-prometheus-stack-grafana  3000:80 &

# Alertmanager
kubectl port-forward -n monitoring svc/kube-prometheus-stack-alertmanager 9093:9093 &

# Go App
kubectl port-forward svc/go-hello-app-service 8080:8080 &

# バックグラウンドプロセスを監視
wait
