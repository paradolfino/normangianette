class AddCategoryToPhrases < ActiveRecord::Migration[5.1]
  def change
    add_column :phrases, :category, :string
  end
end
