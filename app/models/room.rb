class Room < ActiveRecord::Base
  validates_presence_of :name, :description
  validates_length_of :name, :minimum => 3, :maximum => 30
  
  belongs_to :user
  
  scope :search, lambda {|keyword| where(["
    name LIKE ? OR 
    description LIKE ? OR 
    ", 
    "%#{keyword}%", "%#{keyword}%"
  ])}
end
