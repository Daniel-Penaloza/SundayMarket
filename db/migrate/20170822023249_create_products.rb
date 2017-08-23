class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.string :description
      t.text :summary
      t.string :image
      t.integer :category_id
      t.integer :user_id

      t.timestamps
    end
  end
end
