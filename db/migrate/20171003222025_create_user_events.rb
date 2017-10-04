class CreateUserEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :user_events do |t|
      t.string :arrival
      t.string :order

      t.timestamps
    end
  end
end
