class AddAdditionalForUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :website, :string
    add_column :users, :bio, :string
    add_column :users, :gender, :string
    add_column :users, :birthday, :date
  end
end
