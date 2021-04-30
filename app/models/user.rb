class User < ApplicationRecord
  validates :name, presence: true,uniqueness: true
  validates :sexe, presence: true
  validates :profil, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password

  mount_uploader :profil, ProfileUploader
  before_validation { name.downcase! }

  #followship
  has_many :active_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :passive_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy

  has_many :followers, through: :passive_relationships, source: :follower
  has_many :following, through: :active_relationships, source: :followed


  def follow!(other_user)
    active_relationships.create!(followed_id: other_user.id)
  end

  def following?(other_user)
    active_relationships.find_by(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end


  #breakship
  has_many :active_breakships, foreign_key: 'breaker_id', class_name: 'Breakship', dependent: :destroy
  has_many :passive_breakships, foreign_key: 'breaked_id', class_name: 'Breakship', dependent: :destroy

  has_many :breakers, through: :passive_breakships, source: :breaker
  has_many :breaking, through: :active_breakships, source: :breaked

  def break!(other_user)
    active_breakships.create!(breaked_id: other_user.id)
  end

  def breaking?(other_user)
    active_breakships.find_by(breaked_id: other_user.id)
  end

  def unbreak!(other_user)
    active_breakships.find_by(breaked_id: other_user.id).destroy
  end
end
