class Event < ApplicationRecord
  belongs_to :venue
  has_many   :user_events
end
