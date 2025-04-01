# kube-prometheus-stack-go-monitor

kube-prometheus-stack による Goアプリケーションの監視

## 環境構築

GoアプリのDockerイメージを作成する
```sh
docker build -t go-hello-app:v1 ./app
```

KinDでKubernetes環境を構築する
```sh
kind create cluster --name <cluster_name>
kind get kubeconfig --name <cluster_name> > kubeconfig.yaml
export KUBECONFIG=./kubeconfig.yaml:~/.kube/config
```

KinDクラスタにDockerイメージをロードする
```
kind load docker-image go-hello-app:v1 --name <cluster_name>
```

マニフェストを適用する
```sh
kubectl apply -f ./app/deployment.yaml
kubectl apply -f ./app/service.yaml
kubectl apply -f ./app/servicemonitor.yaml
```

helmfileでkube-prometheus-stackをデプロイする
```sh
helmfile sync
```

ポートフォワーディングを実行する
```sh
./port-fwd.sh
```

ブラウザでアクセスする

| サービス名   | URL                   | 
| ------------ | --------------------- | 
| Prometheus   | http://localhost:9090 | 
| Grafana      | http://localhost:3000 | 
| AlertManager | http://localhost:9093 | 
