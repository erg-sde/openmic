class Event < ApplicationRecord
  belongs_to :venue
  has_many   :user_events


  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
end
