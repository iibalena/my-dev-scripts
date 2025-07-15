# 🚀 Deploy automatizado de aplicações Node.js com systemd

Este script realiza o deploy remoto de uma aplicação Node.js/NestJS via SSH, incluindo:
- Pull do repositório Git
- Instalação de dependências
- Build de produção
- Reinício do serviço com `systemctl`

## ✅ Requisitos

### 1. Variáveis de ambiente

Defina as variáveis antes de executar o script:

```bash
export DEPLOY_HOST=meu.servidor.com
export DEPLOY_USER=root
export DEPLOY_PATH=/caminho/para/minha-aplicacao
export DEPLOY_SERVICE=meu-servico.service
```

### 2. Acesso SSH com chave configurada

Configure a chave no servidor com:

```bash
ssh-keygen -t ed25519 -f ~/.ssh/id_deploy -C "deploy-script"
ssh-copy-id -i ~/.ssh/id_deploy.pub $DEPLOY_USER@$DEPLOY_HOST
```

E configure no `~/.ssh/config`:

```
Host meu-alias
  HostName meu.servidor.com
  User root
  IdentityFile ~/.ssh/id_deploy
```

## ▶️ Executando

```bash
chmod +x deploy-template.sh
./deploy-template.sh
```
