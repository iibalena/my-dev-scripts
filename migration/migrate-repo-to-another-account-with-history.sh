#!/bin/bash

# ============================
# CONFIGURAÇÕES DO REPOSITÓRIO
# ============================

REPO_NAME="agri-seguro-front"  # <<< Altere aqui para o nome do repositório
CORPORATE_USERNAME="balenaultra"
PERSONAL_USERNAME="iibalena"
SEU_TOKEN="SEU_TOKEN"  # <<< Insira seu token pessoal do GitHub aqui 

# ============================
# DADOS DO AUTOR
# ============================

NEW_EMAIL="iibalena@gmail.com"
NEW_NAME="Ivonei Balena"

# Emails a substituir no histórico
EMAILS_ANTIGOS=(
  "balenaultra@users.noreply.github.com"  
  "balena@ultrasistemas.com.br"
)

# ============================
# CLONAGEM
# ============================

echo "🔄 Clonando repositório como bare..."
git clone --bare https://github.com/$CORPORATE_USERNAME/$REPO_NAME.git || exit 1
cd "$REPO_NAME.git" || exit 1

# ============================
# REESCREVENDO AUTORES
# ============================

echo "✍️  Reatribuindo autoria de commits..."
git filter-repo --commit-callback "
emails = [$(printf '    (b\"%s\", b\"%s\"),\n' "${EMAILS_ANTIGOS[@]}" "$NEW_EMAIL")]
for old, new in emails:
    if commit.author_email == old:
        commit.author_email = new
        commit.author_name = b\"$NEW_NAME\"
    if commit.committer_email == old:
        commit.committer_email = new
        commit.committer_name = b\"$NEW_NAME\"
"

# ============================
# AJUSTANDO MENSAGENS
# ============================

echo "📝 Ajustando mensagens de commit (balenaultra → iibalena)..."
git filter-repo --message-callback '
msg = message.decode("utf-8")
msg = msg.replace("balenaultra", "iibalena")
return msg.encode("utf-8")
'

# ============================
# PUSH COM AJUSTE DE BUFFER
# ============================

echo "⚙️  Ajustando buffer para push de grandes volumes..."
git config --global http.postBuffer 524288000
git config --global http.lowSpeedLimit 0
git config --global http.lowSpeedTime 999999

echo "🚀 Enviando repositório para a conta pessoal..."
git push --mirror https://$SEU_TOKEN@github.com/$PERSONAL_USERNAME/$REPO_NAME.git

# cd ..
# rm -rf "$REPO_NAME.git"
echo "✅ Migração de '$REPO_NAME' finalizada com sucesso!"







