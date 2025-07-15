#!/bin/bash

FOLDER_NAME="$1"
NEW_REPO_NAME="$2"
NEW_REPO_URL="$3"

if [[ -z "$FOLDER_NAME" || -z "$NEW_REPO_NAME" || -z "$NEW_REPO_URL" ]]; then
  echo "Uso: $0 <pasta> <novo-nome-repo> <url-git>"
  exit 1
fi

echo "📦 Clonando repositório atual com histórico local..."
git clone --no-local . ../$NEW_REPO_NAME
cd ../$NEW_REPO_NAME || exit 1

echo "🧹 Filtrando histórico para pasta $FOLDER_NAME..."
git filter-repo --subdirectory-filter "$FOLDER_NAME"

echo "🔗 Adicionando remoto $NEW_REPO_URL..."
git remote remove origin
git remote add origin "$NEW_REPO_URL"
git push -u origin main

echo "✅ Repositório $NEW_REPO_NAME criado com sucesso."
