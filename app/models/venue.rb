class Venue < ApplicationRecord
  has_many :events
  validates :password, presence: true, length: { minimum: 6 }

  before_save { email.downcase! }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password


  geocoded_by :address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates
  # reverse_geocoded_by :latitude, :longitude
  # after_validation :reverse_geocode  # auto-fetch address

end
