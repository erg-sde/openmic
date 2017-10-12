class Event < ApplicationRecord
  belongs_to :venue
  has_many   :user_events


  def self.search(search)
    if search
      Event.where('name LIKE ?', "%#{search}%")
    else
      Event.all
    end
  end
end
