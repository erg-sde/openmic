class AddVenueToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :venue_id, :integer
    add_index :users, :network_id
  end
end
