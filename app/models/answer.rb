class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :likes, as: :likeable
  
  validates_presence_of :content
end
