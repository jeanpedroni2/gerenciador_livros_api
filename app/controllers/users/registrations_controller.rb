class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    form = UserForm.new(sign_up_params)
    result = UserCreator.new(form).call

    if result.success?
      render json: UserPresenter.new(result.user).as_json, status: :created
    else
      render json: { errors: result.errors }, status: :unprocessable_entity
    end
  end

  private

  # Sobrescrevendo o método padrão do Devise (params)
  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
