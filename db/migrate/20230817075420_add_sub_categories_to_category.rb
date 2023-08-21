class AddSubCategoriesToCategory < ActiveRecord::Migration[7.0]
  def change
    add_reference :categories, :parent
  end
end
