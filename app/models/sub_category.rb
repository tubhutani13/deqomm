class SubCategory < ApplicationRecord
  belongs_to :category
  def self.ransackable_attributes(_auth_object = nil)
    %w[category_id created_at id name updated_at]
  end
end
