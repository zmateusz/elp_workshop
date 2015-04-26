class Like < ActiveRecord::Base
  belongs_to :likeable, polymorphic: true
  belongs_to :user

  validates :user, uniqueness: { scope: [:likeable_id, :likeable_type]}

  def self.liked?(likeable, user)
    Like.where(
      likeable: likeable,
      user: user).any?
  end

end
