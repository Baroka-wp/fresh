class User < ApplicationRecord
  validates :name, presence: true,uniqueness: true
  validates :sexe, presence: true
  validates :profil, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password

  mount_uploader :profil, ProfileUploader
  before_validation { name.downcase! }


  has_many :active_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :passive_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy

  has_many :followers, through: :passive_relationships, source: :follower
  has_many :following, through: :active_relationships, source: :followed

end
