class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :photo, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :parent_id, null: true
      t.string :text

      t.timestamps
    end
  end
end
