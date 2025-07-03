# 📚 Book Manager API

API RESTful construída em Ruby on Rails, com autenticação JWT usando Devise + Devise-JWT, seguindo arquitetura limpa (SOLID) com Service Objects, Form Objects e Presenters, embutido em um devcontainer.

---

## 🔥 Funcionalidades

- Cadastro e login/logout seguro de usuários via JWT
- Cadastro e listagem de livros
- Proteção de rotas autenticadas
- Logout (revogação de token)
- Estrutura baseada em SOLID (Service, Form e Presenter)
- ActiveSupport::Notifications
- Respostas JSON amigáveis

---

## 🚀 Tecnologias

- Ruby 3.4.2
- Rails 8.0.2 (API Mode)
- Devise & Devise-JWT
- ActiveModel, ActiveSupport, JWT
- SQLite >= 2.1
- Puma >= 5.0
- Docker

## 🔴💎 Gems Utilizadas
- gem "rails", "~> 8.0.2"
- gem "sqlite3", ">= 2.1"
- gem "puma", ">= 5.0"
- gem "tzinfo-data", platforms: %i[ windows jruby ]
- gem "solid_cache"
- gem "solid_queue"
- gem "solid_cable"
- gem "bootsnap", require: false
- gem "kamal", require: false
- gem "thruster", require: false
- gem "devise"
- gem "devise-jwt"
- gem "rack-cors"
- group :development, :test do
    # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
    gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  
    # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
    gem "brakeman", require: false
  
    # Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
    gem "rubocop-rails-omakase", require: false
  end

---

## 📦 Instalação

```bash
# Clone o projeto
git clone https://github.com/jeanpedroni2/gerenciador_livros_api.git
cd gerenciador_livros_api

Se estiver usando a IDE VS Code, instale a extensão no gerenciador de pacotes "NuGet"
  Dev Containers from Microsoft - microsoft.com

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

```
## 🛡️ Autenticação (Devise + JWT)
Rotas principais
Método	        Rota	                Ação	                    Autenticado?
POST	          /signup	              Cadastro de usuário	      Não
POST	          /login	              Login, retorna JWT	      Não
DELETE	        /logout	              Logout, revoga JWT	      Sim
GET	            /books	              Listar livros	            Sim
POST	          /books	              Cadastrar livro	          Sim


## Exemplo: Cadastro de usuário
curl -X POST http://localhost:3000/signup \
  -H "Content-Type: application/json" \
  -d '{"user": {"email": "aluno@mba.com", "password": "123456", "password_confirmation": "123456"}}'

## Exemplo: Login (obtenha seu JWT)
curl -i -X POST http://localhost:3000/login \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" \
  -d '{"user": {"email": "aluno@mba.com", "password": "123456"}}'
O token virá no header Authorization.

## Exemplo: Requisições autenticadas
curl http://localhost:3000/books \
  -H "Authorization: Bearer SEU_TOKEN_AQUI"

## Exemplo: Logout
curl -X DELETE http://localhost:3000/logout \
  -H "Authorization: Bearer SEU_TOKEN_AQUI"


## 🎯 Arquitetura
O projeto segue os princípios SOLID, separando responsabilidades em:
- Form Objects (app/forms): validação de dados de entrada
- Service Objects (app/services): lógica de negócio (ex: criação de usuários e livros)
- Presenters (app/presenters): apresentação da resposta JSON
- Notifications: eventos via ActiveSupport::Notifications (ex: log de criação de livro)
- Controllers: orquestram o fluxo, mantendo-se leves


## 🏗️ Teste rápido
Cadastre um usuário

Faça login e obtenha seu token

Use o token para criar e listar livros

Faça logout e veja o token ser revogado
