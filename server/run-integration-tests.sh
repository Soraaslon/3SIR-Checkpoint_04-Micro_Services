#!/usr/bin/env bash

set -e

sudo apt update
sudo apt install -y jq

HTTP_STATUS=$(
    curl -X 'POST' \
    'http://localhost:8080/profissionais' \
    -H 'accept: */*' \
    -H 'Content-Type: application/json' \
    -w "%{http_code}" \
    -o professional_create.json \
    -d '{
    "nome": "Theodor",
    "especialidade": "Cardiologia",
    "valorHora": 250.0
    }'
)
echo "Status HTTP: $HTTP_STATUS"
if [ "$HTTP_STATUS" -ne 201 ]; then
    echo "Erro ao criar profissional"
    exit 1  
fi

PROFISSIONAL_ID=$(jq '.id' professional_create.json)

echo "Profissional criado com ID: $PROFISSIONAL_ID"

HTTP_STATUS=$(
    curl -X 'DELETE' \
    "http://localhost:8080/profissionais/$PROFISSIONAL_ID" \
    -H 'accept: */*' \
    -w "%{http_code}"
)
echo "Status HTTP: $HTTP_STATUS"
if [ "$HTTP_STATUS" -ne 204 ]; then
    echo "Erro ao deletar profissional"
    exit 1
fi

HTTP_STATUS=$(curl -X GET 'http://localhost:8080/profissionais' -o professional_list.json -w "%{http_code}" -H 'accept: */*')
echo "Status HTTP: $HTTP_STATUS"
if [ "$HTTP_STATUS" -ne 200 ]; then
    echo "Erro ao acessar a API de profissionais"
    exit 1  
fi