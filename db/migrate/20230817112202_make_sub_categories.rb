require_relative '20230817075420_add_sub_categories_to_category'

class MakeSubCategories < ActiveRecord::Migration[7.0]
  def change
    revert AddSubCategoriesToCategory
    create_table :sub_categories do |t|
      t.string :name
      t.references :category, foreign_key: true
      t.timestamps
    end
  end
end
