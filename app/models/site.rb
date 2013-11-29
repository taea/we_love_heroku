require 'resolv'
class Site < ActiveRecord::Base
  HEROKU_IPS =  %w(75.101.163.44 75.101.145.87 174.129.212.2)

  belongs_to :user

  validates_presence_of :name, :url, :creator
  validates_length_of :name, :minimum => 3, :maximum => 100
  validates_length_of :url, :minimum => 3, :maximum => 100
  validates_length_of :description, :minimum => 0, :maximum => 1000
  validates_length_of :creator, :minimum => 1, :maximum => 100
  validates_length_of :hash_tag, :minimum => 0, :maximum => 140
  validates_uniqueness_of :url
  validates_url_format_of :url, message: :url_format
  validates_url_format_of :repository_url, message: :url_format, allow_blank: true, allow_nil: true
  validate :url_heroku

  class << self
    def pickups
      Rails.cache.fetch("#{Rails.env}_model_site_pickups", expires_in: 15.minutes) do
        Site.all.to_a.sort_by{rand}[0..2]
      end
    end
  end

  def hash_tags
    '#' + self.hash_tag.split(' ').join(' #')
  end

  def same_creators
    Site.where(:creator => self.creator)
  end

  private
  def url_heroku
    return true if heroku_default
    if self.url =~ /http(?:s)?:\/\/([^\/]+)/
      host = $1
      begin
        ipaddress = Resolv.getaddress host
      rescue => e
        errors.add :url, :heroku_hosted
        return
      end
      unless HEROKU_IPS.include?(ipaddress)
        begin
          cname = Resolv::DNS.new.getresource(host, Resolv::DNS::Resource::IN::ANY).name.to_s
        rescue => e
          errors.add :url, :heroku_hosted
          return
        end

        unless cname =~ /heroku(app|ssl)?\.com\/?/
          errors.add :url, :heroku_hosted
        end
      end
    end
  end

  def heroku_default
    self.url =~ /heroku(app)?\.com\/?/
  end
end
