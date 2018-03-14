class Transfer < ApplicationRecord
  belongs_to :store_to, 
    foreign_key: 'store_to_id',
    class_name: 'Store'
  belongs_to :store_from, 
    foreign_key: 'store_from_id', 
    class_name: 'Store'
  belongs_to :pullout
  belongs_to :delivery
  has_many :transfer_products
  accepts_nested_attributes_for :transfer_products, reject_if: :all_blank,allow_destroy: true

end
