class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :user
  
  validates :title, :content, length: {minimum: 5}
  validates_presence_of :title, :content
end
