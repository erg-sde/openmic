class Event < ApplicationRecord
  belongs_to :venue
  has_many   :user_events

  # 
  # def self.search(search)
  #   if search
  #     where(:all, :conditions => ['name LIKE ?', "%#{search}%"])
  #   else
  #     all
  #   end
  # end
end
