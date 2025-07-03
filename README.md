Aluno: Jean Delamare Pedroni   Email: jean.pedroni@hotmail.com / pedroni01@gmail.com

## 📚 Gerenciador de Livros - API

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

# abra o VSCode
# Inicie o projeto dentro do dev container

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

## Justificativa Arquitetural e de Boas Práticas (Conceitos Utilizados)
A estruturação do projeto utilizou de forma intencional e fundamentada conceitos consagrados em engenharia de software, visando a facilidade de manutenção, evolução, testabilidade e escalabilidade do sistema ao longo do tempo. A seguir, detalham-se os principais elementos arquiteturais aplicados e os benefícios práticos de cada escolha:

## Service Objects
A utilização de Service Objects permite a centralização da lógica de negócio em classes próprias, isolando-a do controller e do model. Isso reduz o acoplamento entre componentes, facilita a realização de testes unitários e minimiza os impactos de alterações futuras, pois a regra de negócio passa a residir em um ponto único, facilmente localizável e extensível.

## Form Objects
Os Form Objects agregam todas as validações de dados de entrada em estruturas independentes dos modelos ActiveRecord. Esse padrão contribui para a coesão do código e para a prevenção de duplicidade de validações, além de permitir maior flexibilidade na manipulação de regras que possam variar conforme o contexto do input. O resultado é uma camada de validação clara, reutilizável e facilmente adaptável a mudanças.

## Presenters
A aplicação do padrão Presenter tem como objetivo separar a lógica de apresentação dos dados da lógica de domínio. Com isso, a formatação das respostas JSON para a API torna-se mais flexível e menos suscetível a alterações indesejadas em regras de negócio. Este padrão também facilita o atendimento a diferentes clientes e formatos de saída no futuro, com baixíssimo impacto sobre o restante do sistema.

## ActiveSupport::Notifications
O uso desse mecanismo de notificações desacopla operações de monitoramento, auditoria e logging das regras principais do sistema, tornando possível incluir novos pontos de observabilidade ou integração com sistemas externos sem modificar o núcleo do código de negócio. Isso reduz riscos e custos de manutenção, aumentando a capacidade de evolução do sistema.

## Devise & Devise-JWT (Autenticação por Token)
O uso de soluções maduras para autenticação provê segurança reconhecida e reduz vulnerabilidades, além de acelerar o desenvolvimento. A escolha por autenticação via JWT torna o sistema stateless, o que facilita a escalabilidade horizontal da aplicação e a integração com diferentes consumidores (web, mobile, etc.), além de simplificar a manutenção por evitar problemas clássicos de sessão e cookies em APIs RESTful.

## Separação de Pastas e Organização do Código
A disposição do código-fonte em pastas específicas para services, forms e presenters contribui diretamente para a legibilidade, previsibilidade e facilidade de onboarding de novos desenvolvedores, além de proporcionar maior controle e segurança em refatorações e expansões do sistema.


## 🏗️ Teste rápido
Cadastre um usuário

Faça login e obtenha seu token

Use o token para criar e listar livros

Faça logout e veja o token ser revogado
