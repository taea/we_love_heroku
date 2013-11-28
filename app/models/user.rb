class User < ActiveRecord::Base
  devise :rememberable, :trackable, :omniauthable

  validates :email, email_format: {allow_nil: true}

  def me?(user)
    return self.id == user.id
  end
end
