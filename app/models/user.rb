class User < ActiveRecord::Base
  devise :rememberable, :trackable, :omniauthable
  has_many :connections, dependent: :delete_all

  validates :email, email_format: {allow_nil: true, allow_blank: true}

  class << self
    def authentication(auth_hash, current_user = nil)
      begin
        params = {
          provider: auth_hash['provider'],
          uid: auth_hash['uid'],
          name: auth_hash['info']['name'],
          nickname: auth_hash['info']['nickname'],
          image: auth_hash['info']['image'],
          access_token: auth_hash['credentials']['token'],
          secret_token: auth_hash['credentials']['secret'],
        }
      rescue => e
        return nil
      end

      connection = Connection.where(provider: params[:provider], uid: params[:uid]).first_or_initialize
      user = current_user ? current_user : connection.user
      user = User.create!(name: params[:name], image: params[:image]) unless user

      params[:user] = user
      connection.update_attributes(params)
      user.update_attributes(name: params[:name], image: params[:image], default_provider: params[:provider])

      return user
    end
  end

  def me?(user)
    return self.id == user.id
  end

  def connected_all?
    self.connections.size === Connection::PROVIDERS.size
  end

  def connected?(provider)
    self.connections.where(provider: provider).exists?
  end
end
