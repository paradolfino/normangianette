class AddCategoryToPhrases < ActiveRecord::Migration[5.1]
  def change
    add_reference :phrases, :category, index: true
  end
end
