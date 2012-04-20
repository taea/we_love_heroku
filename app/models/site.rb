class Site < ActiveRecord::Base
  validates_presence_of :name, :url, :creator
  validates_length_of :name, :minimum => 3, :maximum => 100
  validates_length_of :url, :minimum => 3, :maximum => 100
  validates_length_of :description, :minimum => 0, :maximum => 1000
  validates_length_of :creator, :minimum => 1, :maximum => 100
  validates_length_of :hash_tag, :minimum => 0, :maximum => 140
  validates_uniqueness_of :url
  validates_url_format_of :url
  validates_url_format_of :repository_url, :allow_nil => true, :allow_blank => true
  
  belongs_to :user
  before_save :get_site
  
  scope :search, lambda {|keyword| where(["
    name LIKE ? OR 
    url LIKE ? OR 
    description LIKE ? OR 
    creator LIKE ? OR
    hash_tag LIKE ? OR
    repository_url LIKE ?
    ", 
    "%#{keyword}%", "%#{keyword}%", "%#{keyword}%",
    "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"
  ])}
  
  def hash_tags
    '#' + self.hash_tag.split(' ').join(' #')
  end
  
  def domain
    self.url.gsub(%r{http(?:s)?://([^/]+).+}, '\1')
  end
  
  def same_creators
    Site.where(:creator => self.creator)
  end
  
  def self.pickups
    Rails.cache.fetch("model_site_pickups", :expires_in => 15.minutes) do
      Site.all.sort_by{rand}[0..2]
    end
  end

  def get_site
    begin
      open self.url
      Rails.cache.delete self.image_cache_key
    rescue
      return false
    end
    return true
  end

  def image_cache_key
    "sites_#{self.id}_image"
  end
end
