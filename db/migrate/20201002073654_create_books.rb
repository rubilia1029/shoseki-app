class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :name,null: false
      t.string :author,null: false
      t.integer :category_id,null: false
      t.integer :user_id,null: false
      t.timestamps
    end
  end
end
