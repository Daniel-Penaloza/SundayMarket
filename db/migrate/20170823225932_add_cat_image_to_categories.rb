class AddCatImageToCategories < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :cat_image, :string
  end
end
