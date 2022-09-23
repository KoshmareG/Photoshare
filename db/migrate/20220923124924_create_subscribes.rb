class CreateSubscribes < ActiveRecord::Migration[7.0]
  def change
    create_table :subscribes do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :user_subscribe, null: false, default: 0

      t.timestamps
    end
  end
end
