class SessionPresenter
  def initialize(user, token)
    @user = user
    @token = token
  end

  def as_json(*)
    {
      user: {
        id: @user.id,
        email: @user.email
      },
      token: @token
    }
  end
end
