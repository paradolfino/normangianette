class AddCategoryToWords < ActiveRecord::Migration[5.1]
  def change
    add_reference :words, :category, index: true
  end
end
