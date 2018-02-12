class BeginningInventoryProduct < ApplicationRecord
  belongs_to :product
  belongs_to :ending_inventory
end
