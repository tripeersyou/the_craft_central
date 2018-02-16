class Delivery < ApplicationRecord
  belongs_to :store
  has_many :delivery_products
  has_one :transfer, optional: true
  accepts_nested_attributes_for :delivery_products, reject_if: :all_blank,allow_destroy: true
end
