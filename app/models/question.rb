class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :user
  has_many :likes, as: :likeable

  validates :title, :content, length: {minimum: 5}
  validates_presence_of :title, :content
end
