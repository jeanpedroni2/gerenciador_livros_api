Rails.application.routes.draw do
  # Devise + JWT: Custom controllers e path names para API
  devise_for :users,
    path: "",
    path_names: {
      sign_in: "login",          # POST /login    (login)
      sign_out: "logout",        # DELETE /logout (logout)
      registration: "signup"     # POST /signup   (cadastro)
    },
    controllers: {
      sessions: "users/sessions",
      registrations: "users/registrations"
    },
    defaults: { format: :json } # Garante que sempre será JSON

  # Rotas de livros
  resources :books, only: [ :create, :index ]

  # Healthcheck da aplicação
  get "up" => "rails/health#show", as: :rails_health_check

  # root "posts#index" # (opcional: defina a rota root se desejar)
end
