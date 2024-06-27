#!/bin/bash
echo "Criando imagens do projeto."
docker build -t efrans88/k8s-php-projeto:1.0 backend/.
docker build -t efrans88/db-projeto:1.0 database/.

echo "Subindo as imagens para o docker hub"
docker push efrans88/k8s-php-projeto:1.0
docker push efrans88/db-projeto:1.0

echo "Subindo servicos"
kubectl.exe apply -f services.yml

echo "Subindo banco de dados e backend"
kubectl.exe apply -f deployment.yml

