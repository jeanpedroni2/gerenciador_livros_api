require "ostruct"

class SessionAuthenticator
  def initialize(form)
    @form = form
  end

  def call
    return OpenStruct.new(success?: false, user: nil, errors: @form.errors.full_messages) unless @form.valid?

    user = User.find_by(email: @form.email)
    if user&.valid_password?(@form.password)
      OpenStruct.new(success?: true, user: user, errors: [])
    else
      OpenStruct.new(success?: false, user: nil, errors: [ "Email ou senha inválidos" ])
    end
  end
end
