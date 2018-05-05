class Brand < ApplicationRecord
    has_many :products
    validates :name, presence: true
    def to_s
        name
    end
end
