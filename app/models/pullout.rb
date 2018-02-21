class Pullout < ApplicationRecord
  belongs_to :store
  has_many :pullout_products
  has_one :transfer
  accepts_nested_attributes_for :pullout_products, reject_if: :all_blank, allow_destroy: true
end
