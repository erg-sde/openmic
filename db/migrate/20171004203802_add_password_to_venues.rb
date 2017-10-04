class AddPasswordToVenues < ActiveRecord::Migration[5.1]
  def change
      add_column :venues, :password, :string
  end
end
