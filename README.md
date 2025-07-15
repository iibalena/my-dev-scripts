# 🛠️ my-dev-scripts

Coleção de scripts pessoais e utilitários para automação de tarefas em projetos pessoais e corporativos.

Este repositório contém scripts para deploy de aplicações, migração de repositórios Git, organização de projetos e outros processos comuns no dia a dia de um desenvolvedor.

---

## 📁 Estrutura

### 📁 migration/
Scripts para reorganização de projetos e repositórios Git.

- `extract-subfolder-to-repo.sh`: extrai uma pasta de um monorepo para um novo repositório mantendo o histórico
- `migrate-repo-to-another-account.sh`: clona e reenvia um repositório da conta Ultra para a conta pessoal

### 📁 deploy/
Scripts usados para deploy manual ou automatizado de projetos Node.js (NestJS, etc).

- `deploy-template.sh`: script genérico para deploy remoto via SSH, com build e restart de serviço systemd
- `deploy-template.md`: documentação com instruções de uso, variáveis e setup SSH

### 📁 util/
Scripts diversos, como backup, limpeza de arquivos, monitoramento, etc. *(em breve)*

---

## ✅ Requisitos

- Git
- Bash (ou shell compatível)
- Node.js (em servidores de destino, se for usar scripts de deploy)
- (opcional) [`git-filter-repo`](https://github.com/newren/git-filter-repo) para migração de histórico em projetos Git

---

## 📚 Exemplos de uso

### Deploy de app remoto com systemd:

```bash
export DEPLOY_HOST=meu.servidor.com
export DEPLOY_USER=root
export DEPLOY_PATH=/caminho/para/app
export DEPLOY_SERVICE=meu-servico.service

./deploy/deploy-template.sh
```

---

### 👤 Autor
 Ivonei Balena

 [`Linkedin`](https://www.linkedin.com/in/ivonei-balena-a9a26465/)
