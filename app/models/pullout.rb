class Pullout < ApplicationRecord
  belongs_to :store
  has_many :pullout_products
  belongs_to :transfer, optional: true
  accepts_nested_attributes_for :pullout_products, reject_if: :all_blank, allow_destroy: true
end
