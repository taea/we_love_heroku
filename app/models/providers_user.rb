class ProvidersUser < ActiveRecord::Base
  attr_accessible :provider_id, :user_id, :user_key, :access_token, :refresh_token, :secret, :name, :email, :image
  belongs_to :provider
  belongs_to :user
end
