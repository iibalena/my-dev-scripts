#!/bin/bash

# Variáveis de ambiente esperadas:
# - DEPLOY_HOST
# - DEPLOY_USER
# - DEPLOY_PATH
# - DEPLOY_SERVICE

echo "🔄 Iniciando deploy remoto para $DEPLOY_HOST..."

ssh "$DEPLOY_USER@$DEPLOY_HOST" << EOF
  set -e
  echo "📁 Acessando pasta do projeto..."
  cd "$DEPLOY_PATH"

  echo "⬇️ Fazendo git pull..."
  git pull

  echo "📦 Instalando dependências..."
  npm install --omit=dev

  echo "🛠️ Gerando build de produção com npx nest..."
  npx nest build

  echo "🚀 Reiniciando serviço $DEPLOY_SERVICE..."
  systemctl restart "$DEPLOY_SERVICE"

  echo "✅ Serviço reiniciado com sucesso!"
EOF

echo "🏁 Deploy concluído!"
