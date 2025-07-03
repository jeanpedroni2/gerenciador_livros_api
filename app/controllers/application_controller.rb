class ApplicationController < ActionController::API
  # ...

  rescue_from ActionController::InvalidAuthenticityToken, with: :render_unauthorized

  # Devise fallback para autenticação
  def authenticate_user!(*args)
    unless user_signed_in?
      render_unauthorized
    end
  end

  private

  def render_unauthorized
    render json: { errors: [ "Acesso não autorizado. Por favor, faça login com seu token." ] }, status: :unauthorized
  end
end
