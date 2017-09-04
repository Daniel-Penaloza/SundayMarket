class AddIdProductToDescription < ActiveRecord::Migration[5.1]
  def change
  	add_column :descriptions, :product_id, :integer
  end
end