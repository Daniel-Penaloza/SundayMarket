class AddFieldsToUsers < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :website, :string
  	add_column :users, :shop_description, :string
  end
end
