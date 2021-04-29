class User < ApplicationRecord
  validates :name, presence: true,uniqueness: true
  validates :sexe, presence: true
  validates :profil, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password

  mount_uploader :profil, ProfileUploader
  before_validation { name.downcase! }

end
