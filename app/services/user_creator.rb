require "ostruct"

class UserCreator
  def initialize(form)
    @form = form
  end

  def call
    return OpenStruct.new(success?: false, user: nil, errors: @form.errors.full_messages) unless @form.valid?

    if User.exists?(email: @form.email)
      return OpenStruct.new(success?: false, user: nil, errors: [ "Email já cadastrado" ])
    end

    user = User.create(@form.attributes)
    if user.persisted?
      OpenStruct.new(success?: true, user: user, errors: [])
    else
      OpenStruct.new(success?: false, user: nil, errors: user.errors.full_messages)
    end
  end
end
