class Product < ApplicationRecord
  belongs_to :sub_category
  has_one :category, through: :sub_category
  scope :active, -> { where(active: true) }

  validates_presence_of :sub_category

  def self.ransackable_attributes(_auth_object = nil)
    %w[active sub_category_id id name price created_at updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[category sub_category]
  end
end
