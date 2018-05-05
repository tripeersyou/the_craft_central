require 'rails_helper'

RSpec.describe Order, type: :model do

  it "should have supplier id" do
      order = Order.new({supplier_id: nil, total_items: 0})
      expect(order).to_not be_valid
  end

end
