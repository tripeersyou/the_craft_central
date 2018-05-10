require 'rails_helper'

RSpec.describe Order, type: :model do

  it "should have a supplier id" do
      order = Order.new({supplier_id: nil, total_items: 10})
      expect(order).to_not be_valid
  end
  
  it "should not have a total of items less than 0" do
      order = Order.new({supplier_id: nil, total_items: -10})
      expect(order).to_not be_valid
  end

end
