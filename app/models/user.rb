class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 10 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  validates :profile, length: { maximum: 250 }
  validates :good_point, length: { maximum: 100 }
  has_secure_password
  validates :password, presence: true, length: {maximum: 10}
  mount_uploader :icon, IconUploader
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
end
