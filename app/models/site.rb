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
end
