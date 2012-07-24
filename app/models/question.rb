class Question < ActiveRecord::Base
  attr_accessible :author, :body, :title
  default_scope :order => "created_at DESC"
  
  validates :author, :body, :presence=> true
  validates :author, :length => {:maximum => 100}
  
  has_many :answers
end
