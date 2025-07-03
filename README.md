# 📚 Book Manager API

API RESTful construída em Ruby on Rails, com autenticação JWT usando Devise + Devise-JWT, seguindo arquitetura limpa (SOLID) com Service Objects, Form Objects e Presenters.

---

## 🔥 Funcionalidades

- Cadastro e login seguro de usuários via JWT (Devise)
- Cadastro e listagem de livros
- Proteção de rotas autenticadas
- Logout (revogação de token)
- Estrutura baseada em SOLID (Service, Form e Presenter)
- Respostas JSON amigáveis

---

## 🚀 Tecnologias

- Ruby on Rails 7.x (API Mode)
- Devise & Devise-JWT
- ActiveModel, ActiveSupport, JWT
- SQLite (dev) / PostgreSQL (prod)  
- Docker (opcional, para ambientes)

---

## 📦 Instalação

```bash
# Clone o projeto
git clone https://github.com/seuusuario/book-manager-api.git
cd book-manager-api

# Instale as dependências
bundle install

# Crie e migre o banco
rails db:create db:migrate

# (Opcional) Insira suas credenciais do JWT
EDITOR="code --wait" rails credentials:edit
# Adicione:
# devise_jwt_secret_key: sua_chave_jwt_gerada

# Rode o servidor
rails s
