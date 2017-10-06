class AddEventIdToEventUser < ActiveRecord::Migration[5.1]
  def change
    add_column :user_events, :user_id, :integer
    add_index :user_events, :user_id
    add_column :user_events, :event_id, :integer
    add_index :user_events, :event_id
  end
end
