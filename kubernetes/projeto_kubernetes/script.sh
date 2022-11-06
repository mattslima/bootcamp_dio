#!/bin/bash

echo "Criando as imanges...."

docker build -t mattlima99/projeto-kubernetes:1.0 backend/.

docker build -t mattlima99/projeto-database:1.0 database/.

echo "Realizando push para dockerhub"

docker push mattlima99/projeto-kubernetes:1.0
docker push mattlima99/projeto-database:1.0

echo "Criando os serviços do cluster kubernets"

kubectl apply -f ./services.yml

echo "Criando os deployments"

kubectl apply -f ./deploy.yml