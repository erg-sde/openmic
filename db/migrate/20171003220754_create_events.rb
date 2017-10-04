class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :start
      t.string :end
      t.string :photos
      t.string :type
      t.string :description

      t.timestamps
    end
  end
end
