class Order < ApplicationRecord
  belongs_to :supplier
  has_many :order_products
  accepts_nested_attributes_for :order_products, reject_if: :all_blank,allow_destroy: true
end
