class AddPasswordDigestToVenues < ActiveRecord::Migration[5.1]
  def change
    add_column :venues, :password_digest, :string
  end
end
