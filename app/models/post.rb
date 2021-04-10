# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 500 }
  validates :category_id, presence: true
  belongs_to :category
  has_many :comments, dependent: :destroy
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

  def self.search(search)
    Post.where(['content LIKE ?', "%#{search}%"]) if search
  end

  def self.sort(selection)
    case selection
      when 'new'
        return all.includes([:user]).order(created_at: :DESC)
      when 'old'
        return all.includes([:user]).order(created_at: :ASC)
      when 'likes'
        return find(Favorite.includes([:user]).group(:post_id).includes([:user]).order(Arel.sql('count(post_id) desc')).pluck(:post_id))
      when 'comment'
        return find(Comment.group(:post_id).includes([:user]).order(Arel.sql('count(post_id) desc')).pluck(:post_id))
    end
  end
end
