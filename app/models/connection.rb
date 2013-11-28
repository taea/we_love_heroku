class Connection < ActiveRecord::Base
  extend Enumerize

  PROVIDERS = %i{facebook twitter github}.freeze
  enumerize :provider, in: self::PROVIDERS

  belongs_to :user
end
