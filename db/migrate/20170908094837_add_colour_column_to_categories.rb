class AddColourColumnToCategories < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :color, :string, default: "#4CD762"
  end
end
