class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.boolean :active
      t.references :sub_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
