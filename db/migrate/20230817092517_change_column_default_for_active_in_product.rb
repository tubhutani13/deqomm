class ChangeColumnDefaultForActiveInProduct < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:products, :active, from: false, to: true)
  end
end
