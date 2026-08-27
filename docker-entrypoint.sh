#!/usr/bin/env bash
set -e

PROJECT_NAME="obeservables"

# Se não existir um angular.json, cria o projeto do zero
if [ ! -f "/app/angular.json" ]; then
  echo ">> Nenhum projeto Angular encontrado. Criando '${PROJECT_NAME}'..."
  ng new "${PROJECT_NAME}" \
    --directory . \
    --skip-git \
    --routing \
    --style=scss \
    --defaults
else
  echo ">> Projeto Angular já existe. Instalando dependências (se necessário)..."
  if [ ! -d "/app/node_modules" ]; then
    npm install
  fi
fi

exec "$@"