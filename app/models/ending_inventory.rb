class EndingInventory < ApplicationRecord
  belongs_to :store
  has_many :ending_inventory_products
  has_many :beginning_inventory_products
  accepts_nested_attributes_for :ending_inventory_products, reject_if: :all_blank, allow_destroy: true
end
