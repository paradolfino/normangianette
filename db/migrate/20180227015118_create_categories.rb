class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.references :phrase, polymorphic: true

      t.timestamps
    end
  end
end
