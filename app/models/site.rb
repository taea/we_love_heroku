class Site < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :name, :url, :creator
  validates_length_of :name, :minimum => 3, :maximum => 100
  validates_length_of :url, :minimum => 3, :maximum => 100
  validates_length_of :description, :minimum => 0, :maximum => 1000
  validates_length_of :creator, :minimum => 1, :maximum => 100
  validates_length_of :hash_tag, :minimum => 0, :maximum => 140
  validates_uniqueness_of :url

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
end
