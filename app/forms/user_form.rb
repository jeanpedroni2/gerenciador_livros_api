class UserForm
  include ActiveModel::Model

  attr_accessor :email, :password, :password_confirmation

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  validate :passwords_match

  def passwords_match
    errors.add(:password_confirmation, "não confere com a senha") if password != password_confirmation
  end

  def attributes
    {
      email: email,
      password: password,
      password_confirmation: password_confirmation
    }
  end
end
