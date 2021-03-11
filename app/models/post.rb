class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum:50 }
  validates :content, presence: true, length: { maximum:500 }
  has_one :category
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user


  def like(user)
    favorites.create(user_id: user.id)
  end

  def unlike(user)
    favorites.find_by(user_id: user.id).destroy
  end

  def like?(user)
    favorite_users.include?(user)
  end
end
