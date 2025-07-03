class Users::SessionsController < Devise::SessionsController
  respond_to :json

  def create
    form = SessionForm.new(sign_in_params)
    result = SessionAuthenticator.new(form).call

    if result.success?
      sign_in(result.user, store: false)  # Importante: dispara os hooks do devise-jwt
      token = request.env["warden-jwt_auth.token"]
      render json: { user: { id: result.user.id, email: result.user.email }, token: token }, status: :ok
    else
      render json: { errors: result.errors }, status: :unauthorized
    end
  end

  private

  def respond_to_on_destroy
    render json: { message: "Logout realizado com sucesso." }, status: :ok
  end

  def sign_in_params
    params.require(:user).permit(:email, :password)
  end
end
