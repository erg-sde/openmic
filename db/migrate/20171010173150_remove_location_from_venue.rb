class RemoveLocationFromVenue < ActiveRecord::Migration[5.1]
  def change
    remove_column :venues, :location, :string
  end
end
