class ChangeOrderFormatInEventUser < ActiveRecord::Migration[5.1]
  def change
    change_column :user_events, :order, :int
  end
end
