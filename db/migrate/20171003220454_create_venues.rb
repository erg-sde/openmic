class CreateVenues < ActiveRecord::Migration[5.1]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :location
      t.string :photos
      t.string :description

      t.timestamps
    end
  end
end
