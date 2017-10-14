class Venue < ApplicationRecord
  has_many :events
  validates :password, presence: true, on: :create, length: { minimum: 6 }

  before_save { email.downcase! }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password

  geocoded_by :address
  after_validation :geocode
end
