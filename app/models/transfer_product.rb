class TransferProduct < ApplicationRecord
  belongs_to :transfer
  belongs_to :product
end
