class SessionForm
  include ActiveModel::Model

  attr_accessor :email, :password

  validates :email, presence: true
  validates :password, presence: true

  def attributes
    {
      email: email,
      password: password
    }
  end
end
