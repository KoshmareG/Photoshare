class AddSubscribeToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :subscription_count, :integer, default: 0
    add_column :users, :followers_count, :integer, default: 0
  end
end
