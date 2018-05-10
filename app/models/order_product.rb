class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :product, presence: true
  validates :quantity, presence: true
  validates :quantity, numericality: { greater_than_or_equal_to: 0}
  validate :quantity_not_nill
  def quantity_not_nill
    if quantity == nil || quantity == ""
     errors.add(:quantity, 'Please enter the quantity') 
    end
  end
end
