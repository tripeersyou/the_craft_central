class Brand < ApplicationRecord
    has_many :products
    def to_s
        name
    end
end
